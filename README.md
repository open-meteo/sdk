# Open-Meteo SDK Schema Files

The Open-Meteo weather API uses FlatBuffers to encode API responses efficiently. The compiled schema files for various programming languages can be found in this repository.

The FlatBuffers schema definition can be found in the [./flatbuffers](./flatbuffers) directory. Only non-breaking changes are accepted. Binary compatibility is ensured. Every change will be announced in new release following semantic versioning.

The compiled schema files do not contain any code to perform HTTP calls. They are intent to be used by developers to build client libraries.

More information on how to use the compiled schema files can be found in the directories for each programming language
- [Swift](./swift/)
- [Python](./python/)
- [TypeScript / JavaScript](./ts/)

### Compile FlaBuffers Schema

```bash
flatc --swift -o swift/Sources/OpenMeteoSdk/ flatbuffers/*.fbs
flatc --python --python-typing -o python/ flatbuffers/*.fbs
flatc --ts -o ts/ flatbuffers/*.fbs


```



# License
MIT