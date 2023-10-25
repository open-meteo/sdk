extension openmeteo_sdk_Unit {
    /// Unit Abbreviation as string. Short form e.g. `°C`
    public var abbreviation: String {
        switch self {
        case .undefined: return "undefined"
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        case .kelvin: return "°K"
        case .kilometresPerHour: return "km/h"
        case .milesPerHour: return "mp/h"
        case .knots: return "kn"
        case .metrePerSecond: return "m/s"
        case .metrePerSecondNotUnitConverted: return "m/s"
        case .millimetre: return "mm"
        case .centimetre: return "cm"
        case .inch: return "inch"
        case .feet: return "ft"
        case .metre: return "m"
        case .geopotentialMetre: return "gpm"
        case .percentage: return "%"
        case .hectopascal: return "hPa"
        case .pascal: return "Pa"
        case .degreeDirection: return "°"
        case .wmoCode: return "wmo code"
        case .wattPerSquareMetre: return "W/m²"
        case .kilogramPerSquareMetre: return "kg/m²"
        case .gramPerKilogram: return "g/kg"
        case .perSecond: return "s⁻¹"
        case .seconds: return "s"
        case .cubicMetrePerCubicMetre: return "m³/m³"
        case .cubicMetrePerSecond: return "m³/s"
        case .kilopascal: return "kPa"
        case .megajoulePerSquareMetre: return "MJ/m²"
        case .joulePerKilogram: return "J/kg"
        case .hours: return "h"
        case .iso8601: return "iso8601"
        case .unixTime: return "unixtime"
        case .microgramsPerCubicMetre: return "μg/m³"
        case .grainsPerCubicMetre: return "grains/m³"
        case .dimensionless: return ""
        case .dimensionlessInteger: return ""
        case .europeanAirQualityIndex: return "EAQI"
        case .usAirQualityIndex: return "USAQI"
        case .gddCelsius: return "GGDc"
        case .fraction: return "fraction"
        }
    }
    
    /// Number of significant digits
    public var significantDigits: Int {
        switch self {
        case .undefined: return 0
        case .celsius: return 1
        case .fahrenheit: return 1
        case .kelvin: return 1
        case .kilometresPerHour: return 1
        case .milesPerHour: return 1
        case .knots: return 1
        case .metrePerSecond: return 2
        case .metrePerSecondNotUnitConverted: return 2
        case .millimetre: return 2
        case .inch: return 3
        case .feet: return 3
        case .metre: return 2
        case .percentage: return 0
        case .hectopascal: return 1
        case .degreeDirection: return 0
        case .wmoCode: return 0
        case .wattPerSquareMetre: return 1
        case .cubicMetrePerCubicMetre: return 3
        case .kilopascal: return 2
        case .megajoulePerSquareMetre: return 2
        case .hours: return 1
        case .iso8601: return 0
        case .unixTime: return 0
        case .geopotentialMetre: return 0
        case .kilogramPerSquareMetre: return 2
        case .gramPerKilogram: return 2
        case .perSecond: return 2
        case .pascal: return 0
        case .centimetre: return 2
        case .seconds: return 2
        case .microgramsPerCubicMetre: return 1
        case .grainsPerCubicMetre: return 1
        case .dimensionless: return 2
        case .dimensionlessInteger: return 0
        case .joulePerKilogram: return 1
        case .cubicMetrePerSecond: return 2
        case .europeanAirQualityIndex: return 0
        case .usAirQualityIndex: return 0
        case .gddCelsius: return 2
        case .fraction: return 3
        }
    }
}
