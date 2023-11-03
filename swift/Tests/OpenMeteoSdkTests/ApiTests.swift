import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

/**
 Ensure client side API works
 */
final class ApiTests: XCTestCase {    
    func testApi() async throws {
        let data = Data([52, 3, 0, 0, 32, 0, 0, 0, 28, 0, 28, 0, 24, 0, 20, 0, 16, 0, 12, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 28, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 1, 0, 175, 72, 61, 0, 0, 24, 66, 80, 184, 86, 65, 123, 20, 82, 66, 12, 0, 32, 0, 20, 0, 12, 0, 8, 0, 4, 0, 12, 0, 0, 0, 28, 0, 0, 0, 16, 14, 0, 0, 0, 33, 76, 101, 0, 0, 0, 0, 128, 230, 66, 101, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 20, 0, 0, 0, 16, 0, 16, 0, 15, 0, 11, 0, 0, 0, 4, 0, 0, 0, 12, 0, 16, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 47, 168, 0, 0, 0, 248, 83, 42, 65, 94, 186, 36, 65, 145, 237, 31, 65, 43, 135, 29, 65, 43, 135, 17, 65, 94, 186, 12, 65, 43, 135, 5, 65, 248, 83, 6, 65, 196, 32, 19, 65, 196, 32, 47, 65, 43, 135, 69, 65, 43, 135, 89, 65, 196, 32, 91, 65, 94, 186, 92, 65, 196, 32, 91, 65, 196, 32, 83, 65, 196, 32, 71, 65, 248, 83, 62, 65, 94, 186, 56, 65, 196, 32, 51, 65, 43, 135, 45, 65, 196, 32, 43, 65, 94, 186, 40, 65, 248, 83, 38, 65, 196, 32, 35, 65, 248, 83, 34, 65, 94, 186, 32, 65, 145, 237, 31, 65, 43, 135, 29, 65, 248, 83, 26, 65, 94, 186, 20, 65, 248, 83, 14, 65, 43, 135, 17, 65, 43, 135, 29, 65, 248, 83, 42, 65, 94, 186, 52, 65, 145, 237, 55, 65, 94, 186, 56, 65, 94, 186, 52, 65, 145, 237, 47, 65, 248, 83, 38, 65, 145, 237, 31, 65, 248, 83, 26, 65, 248, 83, 18, 65, 196, 32, 7, 65, 188, 116, 249, 64, 188, 116, 233, 64, 239, 167, 220, 64, 34, 219, 207, 64, 34, 219, 199, 64, 137, 65, 198, 64, 239, 167, 188, 64, 34, 219, 175, 64, 188, 116, 161, 64, 239, 167, 156, 64, 137, 65, 166, 64, 34, 219, 199, 64, 94, 186, 0, 65, 36, 6, 27, 65, 241, 210, 43, 65, 139, 108, 53, 65, 139, 108, 57, 65, 190, 159, 56, 65, 139, 108, 45, 65, 139, 108, 29, 65, 88, 57, 18, 65, 36, 6, 11, 65, 88, 57, 10, 65, 36, 6, 7, 65, 190, 159, 8, 65, 88, 57, 10, 65, 139, 108, 9, 65, 36, 6, 7, 65, 36, 6, 7, 65, 139, 108, 9, 65, 190, 159, 8, 65, 241, 210, 3, 65, 139, 108, 5, 65, 190, 159, 12, 65, 190, 159, 16, 65, 139, 108, 25, 65, 36, 6, 39, 65, 88, 57, 50, 65, 88, 57, 66, 65, 36, 6, 79, 65, 88, 57, 82, 65, 190, 159, 80, 65, 190, 159, 76, 65, 190, 159, 68, 65, 139, 108, 57, 65, 241, 210, 47, 65, 88, 57, 42, 65, 88, 57, 38, 65, 36, 6, 35, 65, 139, 108, 33, 65, 190, 159, 32, 65, 190, 159, 32, 65, 190, 159, 32, 65, 139, 108, 33, 65, 88, 57, 34, 65, 139, 108, 33, 65, 190, 159, 32, 65, 190, 159, 32, 65, 36, 6, 35, 65, 36, 6, 39, 65, 190, 159, 44, 65, 139, 108, 53, 65, 36, 6, 63, 65, 88, 57, 70, 65, 139, 108, 73, 65, 139, 108, 73, 65, 88, 57, 70, 65, 88, 57, 62, 65, 88, 57, 50, 65, 190, 159, 40, 65, 88, 57, 34, 65, 139, 108, 29, 65, 139, 108, 25, 65, 139, 108, 21, 65, 139, 108, 17, 65, 88, 57, 14, 65, 241, 210, 11, 65, 36, 6, 11, 65, 139, 108, 9, 65, 241, 210, 7, 65, 88, 57, 6, 65, 190, 159, 4, 65, 172, 28, 5, 65, 121, 233, 13, 65, 69, 182, 22, 65, 69, 182, 34, 65, 69, 182, 46, 65, 121, 233, 53, 65, 18, 131, 51, 65, 18, 131, 43, 65, 223, 79, 36, 65, 69, 182, 30, 65, 121, 233, 25, 65, 172, 28, 21, 65, 121, 233, 17, 65, 18, 131, 15, 65, 172, 28, 13, 65, 18, 131, 11, 65, 121, 233, 9, 65, 69, 182, 6, 65, 223, 79, 0, 65, 190, 159, 240, 64, 36, 6, 231, 64, 139, 108, 229, 64, 88, 57, 234, 64, 88, 57, 242, 64, 223, 79, 0, 65, 121, 233, 9, 65, 69, 182, 18, 65, 69, 182, 26, 65, 121, 233, 33, 65, 172, 28, 37, 65, 69, 182, 34, 65, 172, 28, 29, 65, 121, 233, 21, 65, 172, 28, 13, 65, 121, 233, 1, 65, 241, 210, 243, 64, 241, 210, 235, 64, 36, 6, 231, 64, 139, 108, 229, 64, 36, 6, 231, 64, 88, 57, 234, 64, 60, 3, 0, 0, 32, 0, 0, 0, 28, 0, 36, 0, 32, 0, 28, 0, 0, 0, 24, 0, 12, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 28, 0, 0, 0, 44, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 43, 61, 154, 153, 1, 65, 102, 102, 32, 66, 12, 0, 32, 0, 20, 0, 12, 0, 8, 0, 4, 0, 12, 0, 0, 0, 28, 0, 0, 0, 16, 14, 0, 0, 0, 33, 76, 101, 0, 0, 0, 0, 128, 230, 66, 101, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 20, 0, 0, 0, 16, 0, 16, 0, 15, 0, 11, 0, 0, 0, 4, 0, 0, 0, 12, 0, 16, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 47, 168, 0, 0, 0, 154, 153, 179, 65, 154, 153, 177, 65, 205, 204, 176, 65, 102, 102, 176, 65, 205, 204, 176, 65, 154, 153, 177, 65, 102, 102, 176, 65, 205, 204, 178, 65, 51, 51, 181, 65, 154, 153, 179, 65, 205, 204, 178, 65, 102, 102, 180, 65, 51, 51, 181, 65, 205, 204, 180, 65, 102, 102, 182, 65, 102, 102, 182, 65, 154, 153, 181, 65, 102, 102, 180, 65, 0, 0, 180, 65, 154, 153, 181, 65, 205, 204, 182, 65, 51, 51, 183, 65, 154, 153, 155, 65, 51, 51, 151, 65, 205, 204, 154, 65, 0, 0, 150, 65, 154, 153, 157, 65, 154, 153, 151, 65, 154, 153, 149, 65, 205, 204, 152, 65, 0, 0, 150, 65, 205, 204, 150, 65, 0, 0, 160, 65, 102, 102, 160, 65, 51, 51, 161, 65, 154, 153, 161, 65, 51, 51, 155, 65, 51, 51, 163, 65, 0, 0, 166, 65, 0, 0, 140, 65, 0, 0, 144, 65, 154, 153, 145, 65, 102, 102, 136, 65, 51, 51, 123, 65, 102, 102, 140, 65, 51, 51, 137, 65, 205, 204, 136, 65, 154, 153, 149, 65, 205, 204, 146, 65, 51, 51, 149, 65, 0, 0, 150, 65, 51, 51, 141, 65, 205, 204, 142, 65, 102, 102, 142, 65, 0, 0, 150, 65, 0, 0, 152, 65, 205, 204, 152, 65, 51, 51, 153, 65, 102, 102, 154, 65, 154, 153, 157, 65, 51, 51, 159, 65, 205, 204, 162, 65, 0, 0, 166, 65, 205, 204, 166, 65, 0, 0, 168, 65, 0, 0, 170, 65, 51, 51, 171, 65, 102, 102, 174, 65, 0, 0, 168, 65, 0, 0, 174, 65, 102, 102, 174, 65, 51, 51, 175, 65, 102, 102, 176, 65, 154, 153, 175, 65, 51, 51, 177, 65, 102, 102, 174, 65, 102, 102, 174, 65, 154, 153, 175, 65, 102, 102, 174, 65, 102, 102, 176, 65, 154, 153, 175, 65, 102, 102, 172, 65, 0, 0, 182, 65, 154, 153, 173, 65, 51, 51, 175, 65, 0, 0, 176, 65, 0, 0, 176, 65, 0, 0, 176, 65, 51, 51, 175, 65, 102, 102, 174, 65, 154, 153, 173, 65, 51, 51, 173, 65, 102, 102, 172, 65, 0, 0, 172, 65, 0, 0, 172, 65, 0, 0, 172, 65, 102, 102, 172, 65, 102, 102, 172, 65, 102, 102, 172, 65, 102, 102, 172, 65, 205, 204, 172, 65, 102, 102, 172, 65, 102, 102, 172, 65, 154, 153, 161, 65, 154, 153, 161, 65, 0, 0, 162, 65, 205, 204, 162, 65, 154, 153, 163, 65, 51, 51, 163, 65, 205, 204, 160, 65, 154, 153, 157, 65, 102, 102, 154, 65, 102, 102, 152, 65, 205, 204, 150, 65, 154, 153, 149, 65, 51, 51, 149, 65, 51, 51, 149, 65, 51, 51, 149, 65, 205, 204, 148, 65, 102, 102, 148, 65, 0, 0, 148, 65, 0, 0, 148, 65, 102, 102, 148, 65, 205, 204, 148, 65, 205, 204, 148, 65, 205, 204, 148, 65, 205, 204, 148, 65, 102, 102, 144, 65, 0, 0, 144, 65, 154, 153, 143, 65, 154, 153, 143, 65, 102, 102, 144, 65, 205, 204, 144, 65, 154, 153, 145, 65, 0, 0, 146, 65, 205, 204, 146, 65, 154, 153, 147, 65, 102, 102, 148, 65, 205, 204, 148, 65, 51, 51, 149, 65, 51, 51, 149, 65, 51, 51, 149, 65, 0, 0, 150, 65, 205, 204, 150, 65, 0, 0, 150, 65, 154, 153, 145, 65, 154, 153, 139, 65, 205, 204, 134, 65, 51, 51, 133, 65, 205, 204, 132, 65, 205, 204, 132, 65, 0, 0, 132, 65, 51, 51, 131, 65, 154, 153, 131, 65, 102, 102, 134, 65, 102, 102, 138, 65, 51, 51, 141, 65, 0, 0, 142, 65, 102, 102, 142, 65, 102, 102, 142, 65, 51, 51, 143, 65, 0, 0, 144, 65, 102, 102, 144, 65, 205, 204, 144, 65, 205, 204, 144, 65, 205, 204, 144, 65, 205, 204, 144, 65, 51, 51, 145, 65])
        //let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52,40.1&longitude=13.41,8.1&hourly=temperature_2m&format=flatbuffers")!
        //let responses = try await WeatherApiResponse.fetch(url: url)
        let responses = try WeatherApiResponse.from(data: data, statusCode: 200)
        
        XCTAssertEqual(responses.count, 2)
        let response = responses[0]
        XCTAssertEqual(response.latitude, 52.52)
        XCTAssertEqual(response.longitude, 13.419998)
        
        let utcOffset = response.utcOffsetSeconds
        
        XCTAssertNotNil(response.hourly)
        let hourly = response.hourly!
        XCTAssertEqual(hourly.variablesCount, 1)
        
        let time = hourly.getDateTime(offset: utcOffset)
        XCTAssertEqual(time.underestimatedCount, 168)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .gmt
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        XCTAssertEqual(dateFormatter.string(from: time[0]), "2023-11-02 00:00")
        
        let temperature2m = hourly.variables(at: 0)!.values
        XCTAssertEqual(temperature2m.count, 168)
        XCTAssertEqual(temperature2m[0], 10.6455)
        
        let response2 = responses[1]
        XCTAssertEqual(response2.latitude, 40.1)
        XCTAssertEqual(response2.longitude, 8.1)
        let hourly2 = response2.hourly!
        let temperature2m2 = hourly2.variables(at: 0)!.values
        XCTAssertEqual(temperature2m2.count, 168)
        XCTAssertEqual(temperature2m2[0], 22.45)
    }
    
    func testError() async throws {
        let data = Data([123, 34, 101, 114, 114, 111, 114, 34, 58, 116, 114, 117, 101, 44, 34, 114, 101, 97, 115, 111, 110, 34, 58, 34, 80, 97, 114, 97, 109, 101, 116, 101, 114, 32, 39, 108, 97, 116, 105, 116, 117, 100, 101, 39, 32, 97, 110, 100, 32, 39, 108, 111, 110, 103, 105, 116, 117, 100, 101, 39, 32, 109, 117, 115, 116, 32, 104, 97, 118, 101, 32, 116, 104, 101, 32, 115, 97, 109, 101, 32, 110, 117, 109, 98, 101, 114, 32, 111, 102, 32, 101, 108, 101, 109, 101, 110, 116, 115, 34, 125])
        //let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=1800")!
        do {
            let _ = try WeatherApiResponse.from(data: data, statusCode: 200)
           //let _ = try await WeatherApiResponse.fetch(url: url)
        } catch {
            XCTAssertTrue(((error as? OpenMeteoSdkError) != nil))
        }
    }
}

