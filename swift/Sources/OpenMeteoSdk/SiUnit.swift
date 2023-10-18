extension openmeteo_sdk_SiUnit {
    /// Unit Abbreviation as string. Short form e.g. `°C`
    public var abbreviation: String {
        switch self {
        case .undefined: return "undefined"
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        case .kelvin: return "°K"
        case .kmh: return "km/h"
        case .mph: return "mp/h"
        case .knots: return "kn"
        case .ms: return "m/s"
        case .msNotUnitConverted: return "m/s"
        case .millimeter: return "mm"
        case .centimeter: return "cm"
        case .inch: return "inch"
        case .feet: return "ft"
        case .meter: return "m"
        case .gpm: return "gpm"
        case .percent: return "%"
        case .hectoPascal: return "hPa"
        case .pascal: return "Pa"
        case .degreeDirection: return "°"
        case .wmoCode: return "wmo code"
        case .wattPerSquareMeter: return "W/m²"
        case .kilogramPerSquareMeter: return "kg/m²"
        case .gramPerKilogram: return "g/kg"
        case .perSecond: return "s⁻¹"
        case .second: return "s"
        case .qubicMeterPerQubicMeter: return "m³/m³"
        case .qubicMeterPerSecond: return "m³/s"
        case .kiloPascal: return "kPa"
        case .megaJoulesPerSquareMeter: return "MJ/m²"
        case .joulesPerKilogram: return "J/kg"
        case .hours: return "h"
        case .iso8601: return "iso8601"
        case .unixtime: return "unixtime"
        case .microgramsPerQuibicMeter: return "μg/m³"
        case .grainsPerQuibicMeter: return "grains/m³"
        case .dimensionless: return ""
        case .dimensionlessInteger: return ""
        case .eaqi: return "EAQI"
        case .usaqi: return "USAQI"
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
        case .kmh: return 1
        case .mph: return 1
        case .knots: return 1
        case .ms: return 2
        case .msNotUnitConverted: return 2
        case .millimeter: return 2
        case .inch: return 3
        case .feet: return 3
        case .meter: return 2
        case .percent: return 0
        case .hectoPascal: return 1
        case .degreeDirection: return 0
        case .wmoCode: return 0
        case .wattPerSquareMeter: return 1
        case .qubicMeterPerQubicMeter: return 3
        case .kiloPascal: return 2
        case .megaJoulesPerSquareMeter: return 2
        case .hours: return 1
        case .iso8601: return 0
        case .unixtime: return 0
        case .gpm: return 0
        case .kilogramPerSquareMeter: return 2
        case .gramPerKilogram: return 2
        case .perSecond: return 2
        case .pascal: return 0
        case .centimeter: return 2
        case .second: return 2
        case .microgramsPerQuibicMeter: return 1
        case .grainsPerQuibicMeter: return 1
        case .dimensionless: return 2
        case .dimensionlessInteger: return 0
        case .joulesPerKilogram: return 1
        case .qubicMeterPerSecond: return 2
        case .eaqi: return 0
        case .usaqi: return 0
        case .gddCelsius: return 2
        case .fraction: return 3
        }
    }
}