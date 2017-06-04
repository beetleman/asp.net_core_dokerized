FROM microsoft/dotnet:1.1.2-sdk
MAINTAINER Mateusz Probachta <mateusz.probachta@gmail.com>

RUN mkdir -p /app
ADD ./src /app
WORKDIR /app

RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]

EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000

ENTRYPOINT ["dotnet", "run"]
