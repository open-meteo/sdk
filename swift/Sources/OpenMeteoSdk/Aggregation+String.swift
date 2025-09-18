extension openmeteo_sdk_Aggregation {
    var string: String {
        switch self {
        case .none_:
            return "none"
        case .minimum:
            return "minimum"
        case .maximum:
            return "maximum"
        case .mean:
            return "mean"
        case .p10:
            return "p10"
        case .p25:
            return "p25"
        case .median:
            return "median"
        case .p75:
            return "p75"
        case .p90:
            return "p90"
        case .dominant:
            return "dominant"
        case .sum:
            return "sum"
        case .spread:
            return "spread"
        }
    }
}
