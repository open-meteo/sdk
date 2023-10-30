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
    implementation("com.open-meteo:sdk:1.4.0")
}
```

or build.gradle

repositories {
    mavenCentral()
}
dependencies {
    implementation 'com.open-meteo:sdk:1.4.0'
}

### Usage

Afterwards classes can be imported from `com.openmeteo.sdk` namespace. E.g:

```java
import com.openmeteo.sdk.WeatherApiResponse;
import com.openmeteo.sdk.Model;
import com.openmeteo.sdk.Variable;
```

#### Filter Specific weather variable
The integrated helper class `VariablesSearch` filters specific weather variables

```java
import com.openmeteo.sdk.VariablesSearch;
import com.openmeteo.sdk.VariableWithValues;
import com.openmeteo.sdk.Variable;
import com.openmeteo.sdk.Aggregation;
import com.openmeteo.sdk.VariablesWithTime;

VariablesWithTime daily = response.daily();
VariableWithValues temperature2mMaximum = new VariablesSearch(daily)
    .variable(Variable.temperature)
    .altitude(2)
    .aggregation(Aggregation.maximum)
    .first();

VariableWithValues[] allTemperatureVariables = new VariablesSearch(daily)
    .variable(Variable.temperature)
    .search();
```
