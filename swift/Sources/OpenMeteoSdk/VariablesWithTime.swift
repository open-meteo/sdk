import Foundation


extension openmeteo_sdk_VariablesWithTime {
    /// Get an array with `Date` for each timestep. `offset` in seconds can be applied to convert to local time.
    public func getDateTime(offset: Int32 = 0) -> [Date] {
        return stride(
            from: time + Int64(offset),
            to: timeEnd + Int64(offset),
            by: Int(interval)
        ).map {
            Date(timeIntervalSince1970: TimeInterval($0))
        }
    }
}
