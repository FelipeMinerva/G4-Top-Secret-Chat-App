FROM mcr.microsoft.com/dotnet/core/aspnet:latest AS mercury-engine
WORKDIR /Mercury.Engine.API
COPY /published/* ./
COPY ./MERCURY/.aspnet/https/* ./
ENTRYPOINT ["dotnet", "Mercury.Engine.API.dll"]
