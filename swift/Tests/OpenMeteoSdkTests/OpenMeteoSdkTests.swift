import XCTest
@testable import OpenMeteoSdk
import FlatBuffers

/**
 Ensure binary compatibility of API responses. Only forward compatibility changes are allowed in the FlatBuffers schemas
 */
final class OpenMeteoSdkTests: XCTestCase {
    /// Test enum values. In case the order is wrongly modified, those tests will fail
    func testEnums() {
        XCTAssertEqual(openmeteo_sdk_Model.cfsv2.rawValue, 51)
        XCTAssertEqual(openmeteo_sdk_Unit.wmoCode.rawValue, 40)
        XCTAssertEqual(openmeteo_sdk_Variable.usAqiCarbonMonoxide.rawValue, 102)
        XCTAssertEqual(openmeteo_sdk_Aggregation.sum.rawValue, 10)
    }
    
    func testApiResponse() throws {
        var fbb = FlatBufferBuilder()
        // Note: Offsets to data do not contain any data, but just ensure the offset is at the right position
        let api = openmeteo_sdk_WeatherApiResponse.createWeatherApiResponse(
            &fbb,
            latitude: 40,
            longitude: 50,
            elevation: 1200,
            generationTimeMilliseconds: 1.231,
            utcOffsetSeconds: 3600,
            timezoneOffset: fbb.create(string: "Europe/Berlin"),
            timezoneAbbreviationOffset: fbb.create(string: "CET"),
            currentOffset: Offset(offset: 11),
            dailyOffset: Offset(offset: 22),
            hourlyOffset: Offset(offset: 33),
            minutely15Offset: Offset(offset: 44),
            sixHourlyOffset: Offset(offset: 55)
        )
        fbb.finish(offset: api)
        XCTAssertEqual(fbb.sizedByteArray, [36, 0, 0, 0, 32, 0, 52, 0, 48, 0, 44, 0, 40, 0, 36, 0, 0, 0, 0, 0, 32, 0, 28, 0, 24, 0, 20, 0, 16, 0, 12, 0, 8, 0, 4, 0, 32, 0, 0, 0, 21, 0, 0, 0, 28, 0, 0, 0, 35, 0, 0, 0, 42, 0, 0, 0, 49, 0, 0, 0, 28, 0, 0, 0, 32, 0, 0, 0, 16, 14, 0, 0, 104, 145, 157, 63, 0, 0, 150, 68, 0, 0, 72, 66, 0, 0, 32, 66, 3, 0, 0, 0, 67, 69, 84, 0, 13, 0, 0, 0, 69, 117, 114, 111, 112, 101, 47, 66, 101, 114, 108, 105, 110, 0, 0, 0])
        
        var bb = fbb.buffer
        let response = getRoot(byteBuffer: &bb) as openmeteo_sdk_WeatherApiResponse
        XCTAssertEqual(response.latitude, 40)
        XCTAssertEqual(response.longitude, 50)
        XCTAssertEqual(response.elevation, 1200)
    }
    
    func testVariablesWithTime() throws {
        var fbb = FlatBufferBuilder()
        // Note: Offsets to data do not contain any data, but just ensure the offset is at the right position
        let api = openmeteo_sdk_VariablesWithTime.createVariablesWithTime(
            &fbb,
            time: 123123123,
            timeEnd: 234235345,
            interval: 123123,
            variablesVectorOffset: Offset(offset: 7777)
        )
        fbb.finish(offset: api)
        XCTAssertEqual(fbb.sizedByteArray, [20, 0, 0, 0, 0, 0, 0, 0, 12, 0, 28, 0, 20, 0, 12, 0, 8, 0, 4, 0, 12, 0, 0, 0, 183, 225, 255, 255, 243, 224, 1, 0, 209, 37, 246, 13, 0, 0, 0, 0, 179, 181, 86, 7, 0, 0, 0, 0])
        
        var bb = fbb.buffer
        let VariableWithValues = getRoot(byteBuffer: &bb) as openmeteo_sdk_VariablesWithTime
        XCTAssertEqual(VariableWithValues.time, 123123123)
        XCTAssertEqual(VariableWithValues.timeEnd, 234235345)
        XCTAssertEqual(VariableWithValues.interval, 123123)
    }
    
    func testVariableWithValues() throws {
        var fbb = FlatBufferBuilder()
        // Note: Offsets to data do not contain any data, but just ensure the offset is at the right position
        let api = openmeteo_sdk_VariableWithValues.createVariableWithValues(
            &fbb,
            variable: .temperature,
            unit: .celsius,
            value: 12.5,
            valuesVectorOffset: fbb.createVector([Float(14.5),15.6]),
            valuesInt64VectorOffset: fbb.createVector([Int64(12345), 234565]),
            altitude: 2,
            aggregation: .maximum,
            pressureLevel: 1015,
            depth: 7,
            depthTo: 28,
            ensembleMember: 50
        )
        fbb.finish(offset: api)
        XCTAssertEqual(fbb.sizedByteArray, [36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 32, 0, 31, 0, 30, 0, 24, 0, 20, 0, 16, 0, 14, 0, 13, 0, 10, 0, 8, 0, 6, 0, 4, 0, 26, 0, 0, 0, 50, 0, 28, 0, 7, 0, 247, 3, 0, 2, 2, 0, 16, 0, 0, 0, 36, 0, 0, 0, 0, 0, 72, 65, 0, 0, 1, 47, 2, 0, 0, 0, 57, 48, 0, 0, 0, 0, 0, 0, 69, 148, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 104, 65, 154, 153, 121, 65])
        
        var bb = fbb.buffer
        let VariableWithValues = getRoot(byteBuffer: &bb) as openmeteo_sdk_VariableWithValues
        XCTAssertEqual(VariableWithValues.ensembleMember, 50)
        XCTAssertEqual(VariableWithValues.unit, .celsius)
        XCTAssertEqual(VariableWithValues.variable, .temperature)
    }
}
