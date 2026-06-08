FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY MigrosFinalProject/MigrosFinalProject/ ./MigrosFinalProject/
RUN dotnet restore MigrosFinalProject/MigrosFinalProject.csproj

RUN dotnet publish MigrosFinalProject/MigrosFinalProject.csproj \
    -c Release \
    -o /app/publish \
    --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:$PORT
ENV ASPNETCORE_ENVIRONMENT=Production

EXPOSE $PORT

ENTRYPOINT ["dotnet", "MigrosFinalProject.dll"]
