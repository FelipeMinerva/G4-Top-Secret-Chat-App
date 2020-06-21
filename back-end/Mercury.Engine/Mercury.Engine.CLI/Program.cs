using Grpc.Core;
using Grpc.Net.Client;
using Mercury.Engine.API.Services;
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
            //var channel = GrpcChannel.ForAddress("192.168.15.16:5001");
            //var client = new Greeter.GreeterClient(channel);

            //var response = await client.SayHelloAsync(
            //    new HelloRequest { Name = "World" });

            //var client = new Chat.ChatClient(channel);
            //var response = await client.RequestMessageAsync(new MessageRequest() { ChatId = "1" });

            //Login test
            var loginClient = new Login.LoginClient(channel);
            var loginResponse = loginClient.RequestLogin(new LoginRequest() 
            { 
                UserEmail = "carolininha@kitty.com", UserName = "Carolina" 
            });

            // Message streaming test
            var subClient = new Subscribe.SubscribeClient(channel);
            var response = subClient.Subscribe(
                new SubRequest()
                {
                    User = new User() { UserId = loginResponse.UserId, UserName = "Carolina" }
                });

            await foreach (var message in response.ResponseStream.ReadAllAsync())
            {
                Console.WriteLine($"{message.Message.User.UserName}: {message.Message.Message_}");
            }


            //Console.WriteLine(response.UserId);
            Console.ReadKey();
        }
    }
}
