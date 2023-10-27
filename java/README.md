# Open-Meteo Java SDK

Available on [Maven Central com.open-meteo/sdk](https://central.sonatype.com/artifact/com.open-meteo/sdk)

## Installation

Please use the latest version on [Maven Central com.open-meteo/sdk](https://central.sonatype.com/artifact/com.open-meteo/sdk)

build.gradle.kts

```
repositories {
    mavenCentral()
}
dependencies {
    implementation("com.open-meteo:sdk:<pick latest version>")
}
```

or build.gradle

repositories {
    mavenCentral()
}
dependencies {
    implementation 'com.open-meteo:sdk:<pick latest version>'
}

### Usage

Afterwards classes can be imported from `com.openmeteo.sdk` namespace. E.g:

```java
import com.openmeteo.sdk.ApiResponse;
import com.openmeteo.sdk.Model;
import com.openmeteo.sdk.Variable;
```