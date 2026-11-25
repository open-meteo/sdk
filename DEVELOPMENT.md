# Development notes

## Release the Java SDK

The GitHub Actions **Release** workflow publishes `com.open-meteo:sdk` to Maven Central from the tag created by semantic-release. Set these secrets in the GitHub `release` environment before running the workflow:

- `MAVEN_CENTRAL_USERNAME` and `MAVEN_CENTRAL_PASSWORD` hold the two values from a [Central Portal user token](https://central.sonatype.org/publish/generate-portal-token/) for an account with access to `com.open-meteo`.
- `GRADLE_SIGNING_KEY` and `GRADLE_SIGNING_PASSWORD` hold the ASCII-armored private GPG key and its passphrase. The [corresponding public key must be available to Maven Central](https://central.sonatype.org/publish/requirements/gpg/#distributing-your-public-key).

If the Maven job fails, check the deployment in the [Central Portal](https://central.sonatype.com/publishing/deployments) before rerunning the failed job in GitHub Actions. A rerun uses the same release tag and version.

## Compile FlatBuffers files

Use flatc 25.9.23 for Swift, Python, and TypeScript and 25.2.10 for C#, Java, and Kotlin.

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
