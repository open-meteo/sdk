# Development notes

## Compile FlatBuffers files

```bash
flatc --swift -o swift/Sources/OpenMeteoSdk/ flatbuffers/*.fbs

flatc --python --python-typing -o python/ flatbuffers/*.fbs
find python/ -name "*.py" -type f -exec sh -c "awk 'sub(/^def.*/,\"\"){f=1} {print} f{exit}' {} > {}_tmp; mv -f {}_tmp {}" \;

cp -r flatbuffers/ flatbuffers_no_namespace/
find flatbuffers_no_namespace -type f -exec sed -i '' -e "s/namespace\ openmeteo_sdk;//" {} \;
flatc --ts -o ts/ flatbuffers_no_namespace/*.fbs
rm -R flatbuffers_no_namespace
```
