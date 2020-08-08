FROM mcr.microsoft.com/dotnet/core/aspnet:latest AS mercury-engine
WORKDIR /Mercury.Engine.API
COPY /bin/Release/netcoreapp3.1/publish/* ./
COPY ./mercurycertificate.pfx ./
ENTRYPOINT ["dotnet", "Mercury.Engine.API.dll"]
