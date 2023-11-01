import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

/**
 Ensure client side API works
 */
final class ApiTests: XCTestCase {
    func testApi() async throws {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52,40.1&longitude=13.41,8.1&hourly=temperature_2m&format=flatbuffers")!

        let responses = try await OpenMeteoSdk.fetchWeatherApi(url: url)
        XCTAssertEqual(responses.count, 2)
        let response = responses[0]
        XCTAssertEqual(response.latitude, 52.52)
        XCTAssertEqual(response.longitude, 13.419998)
        
        XCTAssertNotNil(response.hourly)
        let hourly = response.hourly!
        XCTAssertEqual(hourly.variablesCount, 1)
        let time = stride(from: hourly.time, to: hourly.timeEnd, by: Int(hourly.interval))
        XCTAssertEqual(time.underestimatedCount, 168)
        let temperature2m = hourly.variables(at: 0)!.values
        XCTAssertEqual(temperature2m.count, 168)
        
        let response2 = responses[1]
        XCTAssertEqual(response2.latitude, 40.1)
        XCTAssertEqual(response2.longitude, 8.1)
    }
    
    func testError() async throws {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=1800")!
        do {
           let _ = try await OpenMeteoSdk.fetchWeatherApi(url: url)
        } catch {
            XCTAssertTrue(((error as? OpenMeteoSdkError) != nil))
        }
    }
}

