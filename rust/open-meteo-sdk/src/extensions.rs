use crate::weather_api_generated::openmeteo_sdk::VariablesWithTime;
use chrono::{DateTime, TimeZone, Utc};

impl<'a> VariablesWithTime<'a> {
    /// Get an array with `DateTime<Utc>` for each timestep.
    /// `offset` in seconds can be applied to convert to local time.
    pub fn get_date_time(&self, offset: i32) -> Vec<DateTime<Utc>> {
        let mut result = Vec::new();
        let time_start = self.time() + i64::from(offset);
        let time_end = self.time_end() + i64::from(offset);
        let interval = self.interval() as i64;

        let mut current = time_start;
        while current < time_end {
            if let Some(dt) = Utc.timestamp_opt(current, 0).single() {
                result.push(dt);
            }
            current += interval;
        }

        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::weather_api_generated::openmeteo_sdk::{VariablesWithTime, VariablesWithTimeArgs};
    use flatbuffers::FlatBufferBuilder;

    #[test]
    fn test_get_date_time() {
        // Create a FlatBufferBuilder
        let mut builder = FlatBufferBuilder::new();

        // Time values (in Unix timestamps)
        let start = 1735732800; // 2025-01-01 00:00:00 UTC
        let end = 1738411200; // 2025-02-01 00:00:00 UTC
        let dt_seconds = 3600; // 1 hour in seconds

        // Create the VariablesWithTime object
        let args = VariablesWithTimeArgs {
            time: start,
            time_end: end,
            interval: dt_seconds,
            ..Default::default()
        };

        let vars_offset = VariablesWithTime::create(&mut builder, &args);

        // Finish the buffer
        builder.finish(vars_offset, None);

        // Get the finished buffer and create a root object
        let buf = builder.finished_data();
        let vars = flatbuffers::root::<VariablesWithTime>(buf).unwrap();

        // Test with no offset (UTC)
        let date_times = vars.get_date_time(0);
        let length = date_times.len();
        assert_eq!(length, 744);
        assert_eq!(date_times[0], Utc.timestamp_opt(start, 0).single().unwrap());
        assert_eq!(
            date_times[1],
            Utc.timestamp_opt(start + dt_seconds as i64, 0)
                .single()
                .unwrap()
        );
        assert_eq!(
            date_times[2],
            Utc.timestamp_opt(start + 2 * dt_seconds as i64, 0)
                .single()
                .unwrap()
        );
        assert_eq!(
            date_times.last().unwrap(),
            &Utc.timestamp_opt(end - dt_seconds as i64, 0)
                .single()
                .unwrap()
        );
    }
}
