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

            var channel = GrpcChannel.ForAddress("https://localhost:5001");
            //var client = new Greeter.GreeterClient(channel);

            //var response = await client.SayHelloAsync(
            //    new HelloRequest { Name = "World" });

            var client = new Chat.ChatClient(channel);

            var response = await client.RequestMessageAsync(new MessageRequest() { ChatId = "1" });

            Console.WriteLine(response.Message);
            Console.ReadKey();
        }
    }
}
