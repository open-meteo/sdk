public extension openmeteo_sdk_Variable {
    var string: String {
        switch self {
        case .undefined:
            return "undefined"
        case .apparentTemperature:
            return "apparent_temperature"
        case .cape:
            return "cape"
        case .cloudCover:
            return "cloud_cover"
        case .cloudCoverHigh:
            return "cloud_cover_high"
        case .cloudCoverLow:
            return "cloud_cover_low"
        case .cloudCoverMid:
            return "cloud_cover_mid"
        case .daylightDuration:
            return "daylight_duration"
        case .dewPoint:
            return "dew_point"
        case .diffuseRadiation:
            return "diffuse_radiation"
        case .diffuseRadiationInstant:
            return "diffuse_radiation_instant"
        case .directNormalIrradiance:
            return "direct_normal_irradiance"
        case .directNormalIrradianceInstant:
            return "direct_normal_irradiance_instant"
        case .directRadiation:
            return "direct_radiation"
        case .directRadiationInstant:
            return "direct_radiation_instant"
        case .et0FaoEvapotranspiration:
            return "et0_fao_evapotranspiration"
        case .evapotranspiration:
            return "evapotranspiration"
        case .freezingLevelHeight:
            return "freezing_level_height"
        case .growingDegreeDays:
            return "growing_degree_days"
        case .isDay:
            return "is_day"
        case .latentHeatFlux:
            return "latent_heat_flux"
        case .leafWetnessProbability:
            return "leaf_wetness_probability"
        case .liftedIndex:
            return "lifted_index"
        case .lightningPotential:
            return "lightning_potential"
        case .precipitation:
            return "precipitation"
        case .precipitationHours:
            return "precipitation_hours"
        case .precipitationProbability:
            return "precipitation_probability"
        case .pressureMsl:
            return "pressure_msl"
        case .rain:
            return "rain"
        case .relativeHumidity:
            return "relative_humidity"
        case .runoff:
            return "runoff"
        case .sensibleHeatFlux:
            return "sensible_heat_flux"
        case .shortwaveRadiation:
            return "shortwave_radiation"
        case .shortwaveRadiationInstant:
            return "shortwave_radiation_instant"
        case .showers:
            return "showers"
        case .snowDepth:
            return "snow_depth"
        case .snowHeight:
            return "snow_height"
        case .snowfall:
            return "snowfall"
        case .snowfallHeight:
            return "snowfall_height"
        case .snowfallWaterEquivalent:
            return "snowfall_water_equivalent"
        case .sunrise:
            return "sunrise"
        case .sunset:
            return "sunset"
        case .soilMoisture:
            return "soil_moisture"
        case .soilMoistureIndex:
            return "soil_moisture_index"
        case .soilTemperature:
            return "soil_temperature"
        case .surfacePressure:
            return "surface_pressure"
        case .surfaceTemperature:
            return "surface_temperature"
        case .temperature:
            return "temperature"
        case .terrestrialRadiation:
            return "terrestrial_radiation"
        case .terrestrialRadiationInstant:
            return "terrestrial_radiation_instant"
        case .totalColumnIntegratedWaterVapour:
            return "total_column_integrated_water_vapour"
        case .updraft:
            return "updraft"
        case .uvIndex:
            return "uv_index"
        case .uvIndexClearSky:
            return "uv_index_clear_sky"
        case .vapourPressureDeficit:
            return "vapour_pressure_deficit"
        case .visibility:
            return "visibility"
        case .weatherCode:
            return "weather_code"
        case .windDirection:
            return "wind_direction"
        case .windGusts:
            return "wind_gusts"
        case .windSpeed:
            return "wind_speed"
        case .verticalVelocity:
            return "vertical_velocity"
        case .geopotentialHeight:
            return "geopotential_height"
        case .wetBulbTemperature:
            return "wet_bulb_temperature"
        case .riverDischarge:
            return "river_discharge"
        case .waveHeight:
            return "wave_height"
        case .wavePeriod:
            return "wave_period"
        case .waveDirection:
            return "wave_direction"
        case .windWaveHeight:
            return "wind_wave_height"
        case .windWavePeriod:
            return "wind_wave_period"
        case .windWavePeakPeriod:
            return "wind_wave_peak_period"
        case .windWaveDirection:
            return "wind_wave_direction"
        case .swellWaveHeight:
            return "swell_wave_height"
        case .swellWavePeriod:
            return "swell_wave_period"
        case .swellWavePeakPeriod:
            return "swell_wave_peak_period"
        case .swellWaveDirection:
            return "swell_wave_direction"
        case .pm10:
            return "pm10"
        case .pm2p5:
            return "pm2p5"
        case .dust:
            return "dust"
        case .aerosolOpticalDepth:
            return "aerosol_optical_depth"
        case .carbonMonoxide:
            return "carbon_monoxide"
        case .nitrogenDioxide:
            return "nitrogen_dioxide"
        case .ammonia:
            return "ammonia"
        case .ozone:
            return "ozone"
        case .sulphurDioxide:
            return "sulphur_dioxide"
        case .alderPollen:
            return "alder_pollen"
        case .birchPollen:
            return "birch_pollen"
        case .grassPollen:
            return "grass_pollen"
        case .mugwortPollen:
            return "mugwort_pollen"
        case .olivePollen:
            return "olive_pollen"
        case .ragweedPollen:
            return "ragweed_pollen"
        case .europeanAqi:
            return "european_aqi"
        case .europeanAqiPm2p5:
            return "european_aqi_pm2p5"
        case .europeanAqiPm10:
            return "european_aqi_pm10"
        case .europeanAqiNitrogenDioxide:
            return "european_aqi_nitrogen_dioxide"
        case .europeanAqiOzone:
            return "european_aqi_ozone"
        case .europeanAqiSulphurDioxide:
            return "european_aqi_sulphur_dioxide"
        case .usAqi:
            return "us_aqi"
        case .usAqiPm2p5:
            return "us_aqi_pm2p5"
        case .usAqiPm10:
            return "us_aqi_pm10"
        case .usAqiNitrogenDioxide:
            return "us_aqi_nitrogen_dioxide"
        case .usAqiOzone:
            return "us_aqi_ozone"
        case .usAqiSulphurDioxide:
            return "us_aqi_sulphur_dioxide"
        case .usAqiCarbonMonoxide:
            return "us_aqi_carbon_monoxide"
        case .sunshineDuration:
            return "sunshine_duration"
        case .convectiveInhibition:
            return "convective_inhibition"
        case .shortwaveRadiationClearSky:
            return "shortwave_radiation_clear_sky"
        case .globalTiltedIrradiance:
            return "global_tilted_irradiance"
        case .globalTiltedIrradianceInstant:
            return "global_tilted_irradiance_instant"
        case .oceanCurrentVelocity:
            return "ocean_current_velocity"
        case .oceanCurrentDirection:
            return "ocean_current_direction"
        case .cloudBase:
            return "cloud_base"
        case .cloudTop:
            return "cloud_top"
        case .massDensity:
            return "mass_density"
        case .boundaryLayerHeight:
            return "boundary_layer_height"
        case .formaldehyde:
            return "formaldehyde"
        case .glyoxal:
            return "glyoxal"
        case .nonMethaneVolatileOrganicCompounds:
            return "non_methane_volatile_organic_compounds"
        case .pm10Wildfires:
            return "pm10_wildfires"
        case .peroxyacylNitrates:
            return "peroxyacyl_nitrates"
        case .secondaryInorganicAerosol:
            return "secondary_inorganic_aerosol"
        case .residentialElementaryCarbon:
            return "residential_elementary_carbon"
        case .totalElementaryCarbon:
            return "total_elementary_carbon"
        case .pm25TotalOrganicMatter:
            return "pm2_5_total_organic_matter"
        case .seaSaltAerosol:
            return "sea_salt_aerosol"
        case .nitrogenMonoxide:
            return "nitrogen_monoxide"
        case .thunderstormProbability:
            return "thunderstorm_probability"
        case .rainProbability:
            return "rain_probability"
        case .freezingRainProbability:
            return "freezing_rain_probability"
        case .icePelletsProbability:
            return "ice_pellets_probability"
        case .snowfallProbability:
            return "snowfall_probability"
        case .carbonDioxide:
            return "carbon_dioxide"
        case .methane:
            return "methane"
        case .seaLevelHeightMsl:
            return "sea_level_height_msl"
        case .seaSurfaceTemperature:
            return "sea_surface_temperature"
        case .invertBarometerHeight:
            return "invert_barometer_height"
        case .hail:
            return "hail"
        case .albedo:
            return "albedo"
        case .precipitationType:
            return "precipitation_type"
        case .convectiveCloudBase:
            return "convective_cloud_base"
        case .convectiveCloudTop:
            return "convective_cloud_top"
        case .snowDepthWaterEquivalent:
            return "snow_depth_water_equivalent"
        case .secondarySwellWaveHeight:
            return "secondary_swell_wave_height"
        case .secondarySwellWavePeriod:
            return "secondary_swell_wave_period"
        case .secondarySwellWavePeakPeriod:
            return "secondary_swell_wave_peak_period"
        case .secondarySwellWaveDirection:
            return "secondary_swell_wave_direction"
        case .tertiarySwellWaveHeight:
            return "tertiary_swell_wave_height"
        case .tertiarySwellWavePeriod:
            return "tertiary_swell_wave_period"
        case .tertiarySwellWavePeakPeriod:
            return "tertiary_swell_wave_peak_period"
        case .tertiarySwellWaveDirection:
            return "tertiary_swell_wave_direction"
        }
    }

    init?(rawValue: String) {
        switch rawValue {
        case "undefined":
            self = .undefined
        case "apparent_temperature":
            self = .apparentTemperature
        case "cape":
            self = .cape
        case "cloud_cover":
            self = .cloudCover
        case "cloud_cover_high":
            self = .cloudCoverHigh
        case "cloud_cover_low":
            self = .cloudCoverLow
        case "cloud_cover_mid":
            self = .cloudCoverMid
        case "daylight_duration":
            self = .daylightDuration
        case "dew_point":
            self = .dewPoint
        case "diffuse_radiation":
            self = .diffuseRadiation
        case "diffuse_radiation_instant":
            self = .diffuseRadiationInstant
        case "direct_normal_irradiance":
            self = .directNormalIrradiance
        case "direct_normal_irradiance_instant":
            self = .directNormalIrradianceInstant
        case "direct_radiation":
            self = .directRadiation
        case "direct_radiation_instant":
            self = .directRadiationInstant
        case "et0_fao_evapotranspiration":
            self = .et0FaoEvapotranspiration
        case "evapotranspiration":
            self = .evapotranspiration
        case "freezing_level_height":
            self = .freezingLevelHeight
        case "growing_degree_days":
            self = .growingDegreeDays
        case "is_day":
            self = .isDay
        case "latent_heat_flux":
            self = .latentHeatFlux
        case "leaf_wetness_probability":
            self = .leafWetnessProbability
        case "lifted_index":
            self = .liftedIndex
        case "lightning_potential":
            self = .lightningPotential
        case "precipitation":
            self = .precipitation
        case "precipitation_hours":
            self = .precipitationHours
        case "precipitation_probability":
            self = .precipitationProbability
        case "pressure_msl":
            self = .pressureMsl
        case "rain":
            self = .rain
        case "relative_humidity":
            self = .relativeHumidity
        case "runoff":
            self = .runoff
        case "sensible_heat_flux":
            self = .sensibleHeatFlux
        case "shortwave_radiation":
            self = .shortwaveRadiation
        case "shortwave_radiation_instant":
            self = .shortwaveRadiationInstant
        case "showers":
            self = .showers
        case "snow_depth":
            self = .snowDepth
        case "snow_height":
            self = .snowHeight
        case "snowfall":
            self = .snowfall
        case "snowfall_height":
            self = .snowfallHeight
        case "snowfall_water_equivalent":
            self = .snowfallWaterEquivalent
        case "sunrise":
            self = .sunrise
        case "sunset":
            self = .sunset
        case "soil_moisture":
            self = .soilMoisture
        case "soil_moisture_index":
            self = .soilMoistureIndex
        case "soil_temperature":
            self = .soilTemperature
        case "surface_pressure":
            self = .surfacePressure
        case "surface_temperature":
            self = .surfaceTemperature
        case "temperature":
            self = .temperature
        case "terrestrial_radiation":
            self = .terrestrialRadiation
        case "terrestrial_radiation_instant":
            self = .terrestrialRadiationInstant
        case "total_column_integrated_water_vapour":
            self = .totalColumnIntegratedWaterVapour
        case "updraft":
            self = .updraft
        case "uv_index":
            self = .uvIndex
        case "uv_index_clear_sky":
            self = .uvIndexClearSky
        case "vapour_pressure_deficit":
            self = .vapourPressureDeficit
        case "visibility":
            self = .visibility
        case "weather_code":
            self = .weatherCode
        case "wind_direction":
            self = .windDirection
        case "wind_gusts":
            self = .windGusts
        case "wind_speed":
            self = .windSpeed
        case "vertical_velocity":
            self = .verticalVelocity
        case "geopotential_height":
            self = .geopotentialHeight
        case "wet_bulb_temperature":
            self = .wetBulbTemperature
        case "river_discharge":
            self = .riverDischarge
        case "wave_height":
            self = .waveHeight
        case "wave_period":
            self = .wavePeriod
        case "wave_direction":
            self = .waveDirection
        case "wind_wave_height":
            self = .windWaveHeight
        case "wind_wave_period":
            self = .windWavePeriod
        case "wind_wave_peak_period":
            self = .windWavePeakPeriod
        case "wind_wave_direction":
            self = .windWaveDirection
        case "swell_wave_height":
            self = .swellWaveHeight
        case "swell_wave_period":
            self = .swellWavePeriod
        case "swell_wave_peak_period":
            self = .swellWavePeakPeriod
        case "swell_wave_direction":
            self = .swellWaveDirection
        case "pm10":
            self = .pm10
        case "pm2p5":
            self = .pm2p5
        case "dust":
            self = .dust
        case "aerosol_optical_depth":
            self = .aerosolOpticalDepth
        case "carbon_monoxide":
            self = .carbonMonoxide
        case "nitrogen_dioxide":
            self = .nitrogenDioxide
        case "ammonia":
            self = .ammonia
        case "ozone":
            self = .ozone
        case "sulphur_dioxide":
            self = .sulphurDioxide
        case "alder_pollen":
            self = .alderPollen
        case "birch_pollen":
            self = .birchPollen
        case "grass_pollen":
            self = .grassPollen
        case "mugwort_pollen":
            self = .mugwortPollen
        case "olive_pollen":
            self = .olivePollen
        case "ragweed_pollen":
            self = .ragweedPollen
        case "european_aqi":
            self = .europeanAqi
        case "european_aqi_pm2p5":
            self = .europeanAqiPm2p5
        case "european_aqi_pm10":
            self = .europeanAqiPm10
        case "european_aqi_nitrogen_dioxide":
            self = .europeanAqiNitrogenDioxide
        case "european_aqi_ozone":
            self = .europeanAqiOzone
        case "european_aqi_sulphur_dioxide":
            self = .europeanAqiSulphurDioxide
        case "us_aqi":
            self = .usAqi
        case "us_aqi_pm2p5":
            self = .usAqiPm2p5
        case "us_aqi_pm10":
            self = .usAqiPm10
        case "us_aqi_nitrogen_dioxide":
            self = .usAqiNitrogenDioxide
        case "us_aqi_ozone":
            self = .usAqiOzone
        case "us_aqi_sulphur_dioxide":
            self = .usAqiSulphurDioxide
        case "us_aqi_carbon_monoxide":
            self = .usAqiCarbonMonoxide
        case "sunshine_duration":
            self = .sunshineDuration
        case "convective_inhibition":
            self = .convectiveInhibition
        case "shortwave_radiation_clear_sky":
            self = .shortwaveRadiationClearSky
        case "global_tilted_irradiance":
            self = .globalTiltedIrradiance
        case "global_tilted_irradiance_instant":
            self = .globalTiltedIrradianceInstant
        case "ocean_current_velocity":
            self = .oceanCurrentVelocity
        case "ocean_current_direction":
            self = .oceanCurrentDirection
        case "cloud_base":
            self = .cloudBase
        case "cloud_top":
            self = .cloudTop
        case "mass_density":
            self = .massDensity
        case "boundary_layer_height":
            self = .boundaryLayerHeight
        case "formaldehyde":
            self = .formaldehyde
        case "glyoxal":
            self = .glyoxal
        case "non_methane_volatile_organic_compounds":
            self = .nonMethaneVolatileOrganicCompounds
        case "pm10_wildfires":
            self = .pm10Wildfires
        case "peroxyacyl_nitrates":
            self = .peroxyacylNitrates
        case "secondary_inorganic_aerosol":
            self = .secondaryInorganicAerosol
        case "residential_elementary_carbon":
            self = .residentialElementaryCarbon
        case "total_elementary_carbon":
            self = .totalElementaryCarbon
        case "pm2_5_total_organic_matter":
            self = .pm25TotalOrganicMatter
        case "sea_salt_aerosol":
            self = .seaSaltAerosol
        case "nitrogen_monoxide":
            self = .nitrogenMonoxide
        case "thunderstorm_probability":
            self = .thunderstormProbability
        case "rain_probability":
            self = .rainProbability
        case "freezing_rain_probability":
            self = .freezingRainProbability
        case "ice_pellets_probability":
            self = .icePelletsProbability
        case "snowfall_probability":
            self = .snowfallProbability
        case "carbon_dioxide":
            self = .carbonDioxide
        case "methane":
            self = .methane
        case "sea_level_height_msl":
            self = .seaLevelHeightMsl
        case "sea_surface_temperature":
            self = .seaSurfaceTemperature
        case "invert_barometer_height":
            self = .invertBarometerHeight
        case "hail":
            self = .hail
        case "albedo":
            self = .albedo
        case "precipitation_type":
            self = .precipitationType
        case "convective_cloud_base":
            self = .convectiveCloudBase
        case "convective_cloud_top":
            self = .convectiveCloudTop
        case "snow_depth_water_equivalent":
            self = .snowDepthWaterEquivalent
        case "secondary_swell_wave_height":
            self = .secondarySwellWaveHeight
        case "secondary_swell_wave_period":
            self = .secondarySwellWavePeriod
        case "secondary_swell_wave_peak_period":
            self = .secondarySwellWavePeakPeriod
        case "secondary_swell_wave_direction":
            self = .secondarySwellWaveDirection
        case "tertiary_swell_wave_height":
            self = .tertiarySwellWaveHeight
        case "tertiary_swell_wave_period":
            self = .tertiarySwellWavePeriod
        case "tertiary_swell_wave_peak_period":
            self = .tertiarySwellWavePeakPeriod
        case "tertiary_swell_wave_direction":
            self = .tertiarySwellWaveDirection
        default:
            return nil
        }
    }
}
