# Development notes

## Compile FlatBuffers files

AWK is used to remove create functions for flatbuffer messages

```bash
flatc --swift -o swift/Sources/OpenMeteoSdk/ flatbuffers/*.fbs

flatc --csharp -o csharp/ flatbuffers/*.fbs

flatc --python --python-typing -o python/ flatbuffers/*.fbs
find python/ -name "*.py" -type f -exec sh -c "awk 'sub(/^def.*/,\"\"){f=1} {print} f{exit}' {} > {}_tmp; mv -f {}_tmp {}" \;

cp -r flatbuffers/ flatbuffers_no_namespace/
find flatbuffers_no_namespace -type f -exec sed -i '' -e "s/namespace\ openmeteo_sdk;//" {} \;
flatc --ts -o ts/ flatbuffers_no_namespace/*.fbs
find ts/ -name "*.ts" -type f -exec sh -c "awk 'sub(/^static\ start.*/,\"}\"){f=1} {print} f{exit}' {} > {}_tmp; mv -f {}_tmp {}" \;
rm -R flatbuffers_no_namespace

cp -r flatbuffers/ flatbuffers_fqdn/
find flatbuffers_fqdn -type f -exec sed -i '' -e "s/namespace\ openmeteo_sdk;/namespace\ com.openmeteo.sdk;/" {} \;
flatc --kotlin -o kotlin/ flatbuffers_fqdn/*.fbs
flatc --java --gen-nullable -o java/ flatbuffers_fqdn/*.fbs
rm -R flatbuffers_fqdn
```
