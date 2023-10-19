# Development notes

## Compile FlatBuffers files

```bash
flatc --swift -o swift/Sources/OpenMeteoSdk/ flatbuffers/*.fbs
flatc --python --python-typing -o python/ flatbuffers/*.fbs

cp -r flatbuffers/ flatbuffers_no_namespace/
find flatbuffers_no_namespace -type f -exec sed -i '' -e "s/namespace\ openmeteo_sdk;//" {} \;
flatc --ts -o ts/ flatbuffers_no_namespace/*.fbs
rm -R flatbuffers_no_namespace
```
