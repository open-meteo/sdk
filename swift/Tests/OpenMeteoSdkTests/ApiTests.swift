import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

/**
 Ensure client side API works
 */
final class ApiTests: XCTestCase {
    func testApi() async throws {
        //"https://api.open-meteo.com/v1/forecast";
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52,40.1&longitude=13.41,8.1&hourly=temperature_2m&format=flatbuffers")!

        let results = try await OpenMeteoSdk.fetchWeatherApi(url: url)
        XCTAssertEqual(results.count, 2)
        let result = results[0]
        XCTAssertEqual(result.latitude, 52.52)
        XCTAssertEqual(result.longitude, 13.419998)
        
        let result2 = results[1]
        XCTAssertEqual(result2.latitude, 40.1)
        XCTAssertEqual(result2.longitude, 8.1)
    }
    
    func testError() async throws {
        //"https://api.open-meteo.com/v1/forecast";
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=1800")!
        do {
           let _ = try await OpenMeteoSdk.fetchWeatherApi(url: url)
        } catch {
            XCTAssertTrue(((error as? OpenMeteoSdkError) != nil))
        }
    }
}

