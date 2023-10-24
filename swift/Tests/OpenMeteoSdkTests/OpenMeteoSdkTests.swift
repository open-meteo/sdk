import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

final class OpenMeteoSdkTests: XCTestCase {
    /// Test enum values. In case the order is wrongly modified, those tests will fail
    func testEnums() {
        XCTAssertEqual(openmeteo_sdk_Model.cfsv2.rawValue, 51)
        XCTAssertEqual(openmeteo_sdk_Unit.wmoCode.rawValue, 40)
        XCTAssertEqual(openmeteo_sdk_Variable.usAqiCarbonMonoxide.rawValue, 102)
        XCTAssertEqual(openmeteo_sdk_Aggregation.sum.rawValue, 10)
    }
    
    func testWeatherAPI() throws {
        var fbb = FlatBufferBuilder()
        let api = openmeteo_sdk_ApiResponse.createApiResponse(&fbb, latitude: 40, longitude: 50)
        fbb.finish(offset: api)
        XCTAssertEqual(fbb.sizedByteArray, [12, 0, 0, 0, 8, 0, 12, 0, 8, 0, 4, 0, 8, 0, 0, 0, 0, 0, 72, 66, 0, 0, 32, 66])
        
        var bb = fbb.buffer
        let response = getRoot(byteBuffer: &bb) as openmeteo_sdk_ApiResponse
        XCTAssertEqual(response.latitude, 40)
        XCTAssertEqual(response.longitude, 50)
        XCTAssertEqual(response.elevation, 0)
    }
}
