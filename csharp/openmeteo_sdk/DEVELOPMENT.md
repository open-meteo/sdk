```
update version in 
cd openmeteo_sdk.csharp
dotnet pack
dotnet nuget push bin/Release/openmeteo_sdk.1.10.0.nupkg --api-key xxxx --source https://api.nuget.org/v3/index.json
```