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

#### Example with `okhttp3``

```java
private byte[] responseIN = null;

// Step 1 : Request e.g.
// Please observe the parameter format=flatbuffers in mUrl, as the 
// WeatherApiResponse.getRootAsWeatherApiResponse((ByteBuffer) buffer.position(4));
// further down expects a flatbuffer and not Json - which is the default format returned from the API
String mUrl = "https://api.open-meteo.com/v1/forecast?latitude=49.70808&longitude=8.08829&timezone=Europe/Berlin&minutely_15=temperature_2m,weathercode&format=flatbuffers";

okhttp3.Request request = new okhttp3.Request.Builder()
        .url(mUrl).method("GET", null)
        .build();

client.newCall(request).enqueue(new Callback()
{
    public void onFailure(okhttp3.Call call, IOException e)
    {
        e.printStackTrace();
    }

    @Override
    public void onResponse(Call call, okhttp3.Response response) throws IOException
    {
        if (response.isSuccessful())
        {
                responseIN = response.body().bytes();
        }
    }
});

// Step 2 : Use Binary Response buffer and convert it to ByteBuffer
ByteBuffer buffer = ByteBuffer.wrap(responseIN).order(ByteOrder.LITTLE_ENDIAN);

// Step 3 : create the ApiResponse Instance
// Note : The first 4 bytes interpret the length of the datablock
WeatherApiResponse mApiResponse = WeatherApiResponse.getRootAsWeatherApiResponse((ByteBuffer) buffer.position(4));


// Step 4 : get the minutely15 block
VariablesWithTime minutely15 =  mApiResponse.minutely15();

VariableWithValues temperature2m = new VariablesSearch(minutely15)
                .variable(Variable.temperature)
                .altitude(2)
                .first();
VariableWithValues wmo = new VariablesSearch(minutely15)
                .variable(Variable.weather_code)
                .first();

for ( int vl = 0; vl < temperature2m.valuesLength(); vl ++)
    Log.d(TAG, "Temperature and wmo at index : " + vl + " -> " + temperature2m.values(vl) + " / " + wmo.values(vl));

buffer.clear();
```
