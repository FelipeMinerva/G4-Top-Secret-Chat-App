using Grpc.Core;
using Grpc.Net.Client;
using Mercury.Engine.API.Models.GrpcGenerated;
using Mercury.Engine.API.Services;
using Mercury.Engine.API.Services.GrpcGenerated;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace Mercury.Engine.CLI
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var httpHandler = new HttpClientHandler();
            // Return `true` to allow certificates th at are untrusted/invalid
            //httpHandler.ServerCertificateCustomValidationCallback =
            //    HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;

            //var channel = GrpcChannel.ForAddress(new UriBuilder("https://127.0.0.1:5001").Uri);
            var channel = GrpcChannel.ForAddress("https://localhost:5001");



            // Message streaming test
            //var subClient = new Subscribe.SubscribeClient(channel);
            //var response = subClient.Subscribe(
            //    new SubRequest()
            //    {
            //        User = new User() { UserId = loginResponse.UserId, UserName = "Carolina" }
            //    });

            var client = new Chat.ChatClient(channel);

            var request = client.Subscribe();


            Console.WriteLine("Starting background task to receive messages");
            var readTask = Task.Run(async () =>
            {
                await foreach (var response in request.ResponseStream.ReadAllAsync())
                {

                    Console.WriteLine(response.Message.User.UserTag + " " + response.Message.Text);
                }
            });

            Console.WriteLine("Starting to send messages");
            Console.WriteLine("Type a message to echo then press enter.");
            while (true)
            {
                var result = Console.ReadLine();
                if (string.IsNullOrEmpty(result))
                {
                    break;
                }

                await request.RequestStream.WriteAsync(new SubscriptionRequest
                {
                    Message = new Message
                    {
                        GroupId = 1,
                        User = new User { UserEmail = "papu@mercury.com", UserTag = "papu", UserId = 3 },
                        Text = result,
                        Timestamp = DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss")
                    },
                    UserId = 1
                }); ;
            }

            Console.WriteLine("Disconnecting");
            await request.RequestStream.CompleteAsync();
            await readTask;

            Console.ReadKey();
        }
    }
}
