#[cfg(feature = "extensions")]
mod extensions;
mod weather_api_generated;

#[cfg(feature = "extensions")]
#[allow(unused_imports)]
pub use extensions::*;

pub use weather_api_generated::openmeteo_sdk::*;
