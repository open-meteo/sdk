import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

final class OpenMeteoSdkTests: XCTestCase {
    func testWeatherAPI() throws {
        var fbb = FlatBufferBuilder()
        let api = openmeteo_sdk_WeatherApiResponse.createWeatherApiResponse(&fbb, latitude: 40, longitude: 50)
        fbb.finish(offset: api)
        XCTAssertEqual(fbb.sizedByteArray, [12, 0, 0, 0, 8, 0, 12, 0, 8, 0, 4, 0, 8, 0, 0, 0, 0, 0, 72, 66, 0, 0, 32, 66])
        
        var bb = fbb.buffer
        let response = getRoot(byteBuffer: &bb) as openmeteo_sdk_WeatherApiResponse
        XCTAssertEqual(response.latitude, 40)
        XCTAssertEqual(response.longitude, 50)
        XCTAssertEqual(response.elevation, 0)
    }
}
