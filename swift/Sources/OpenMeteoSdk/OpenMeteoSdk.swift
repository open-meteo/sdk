import Foundation
import FlatBuffers

public typealias WeatherApiResponse = openmeteo_sdk_WeatherApiResponse

public enum OpenMeteoSdkError: Error {
    case error(message: String)
    case serverError(statusCode: Int)
}

public struct OpenMeteoSdk {
    /// Fetch data from a given URL and decode the Open-Meteo Weather API Flatbuffers structure
    @available(macOS 12.0, *)
    public static func fetchWeatherApi(url: URL) async throws -> [WeatherApiResponse] {
        let data = try await fetchData(url: url)
        return WeatherApiResponse.from(data: data)
    }
    
    /// Fetch `Data` from Open-Meteo API. Decode potential error for HTTP code 400 and 429,
    @available(macOS 12.0, *)
    public static func fetchData(url: URL) async throws -> Data {
        struct ErorJson: Decodable {
            let error: Bool
            let reason: String
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = (response as? HTTPURLResponse) else {
            throw OpenMeteoSdkError.error(message: "response is not type HTTPURLResponse")
        }
        if [400, 429].contains(res.statusCode) {
            let reason = try JSONDecoder().decode(ErorJson.self, from: data).reason
            throw OpenMeteoSdkError.error(message: reason)
        }
        if res.statusCode != 200 {
            throw OpenMeteoSdkError.serverError(statusCode: res.statusCode)
        }
        return data
    }
}


extension FlatBufferObject {
    /// Decode multiple size prefixed FlatBuffer messages from `Data`.
    /// Contents of data will be copied into a `ByteBuffer` and each message keeps a reference.
    /// Thus, memory will be correctly retrained and released
    public static func from(data: Data) -> [Self] {
        return getSizePrefixedMessages(bb: ByteBuffer(data: data))
    }
    
    /// Decode multiple size prefixed FlatBuffer messages from a `ByteBuffer`.
    public static func getSizePrefixedMessages(bb: ByteBuffer) -> [Self] {
        var results = [Self]()
        var position: Int32 = 0
        while position < bb.size {
            let length = bb.read(def: Int32.self, position: Int(position))
            let uoffset = bb.read(def: UOffset.self, position: Int(position) + 4)
            let result = Self.init(bb, o: position + 4 + Int32(uoffset))
            results.append(result)
            position += length + 4
        }
        return results
    }
}
