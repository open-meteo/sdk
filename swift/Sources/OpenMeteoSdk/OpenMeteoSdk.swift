import Foundation
import FlatBuffers

public typealias WeatherApiResponse = openmeteo_sdk_WeatherApiResponse

public enum OpenMeteoSdkError: Error {
    case error(message: String)
    case serverError(statusCode: Int)
}

extension WeatherApiResponse {
    #if !os(Linux)
    /// Fetch data from a given URL and decode the Open-Meteo Weather API Flatbuffers structure
    @available(iOS 13.0.0, *)
    @available(macOS 12.0, *)
    public static func fetch(url: URL, session: URLSession = URLSession.shared) async throws -> [WeatherApiResponse] {
        let (data, response) = try await session.data(from: url)
        guard let res = (response as? HTTPURLResponse) else {
            throw OpenMeteoSdkError.error(message: "response is not type HTTPURLResponse")
        }
        return try WeatherApiResponse.from(data: data, statusCode: res.statusCode)
    }
    #endif
}


/// If the API throws an error, this it the JSON error format
struct OpenMeteoErorJson: Decodable {
    let error: Bool
    let reason: String
}

extension FlatBufferObject where Self: Verifiable {
    /// Decode multiple size prefixed FlatBuffer messages from `Data`.
    ///
    /// Check for status code. For code 400 and 429, the error message will be decoded from `data` and thrown
    ///
    /// Contents of data will be copied into a `ByteBuffer` and each message keeps a reference.
    /// Thus, memory will be correctly retrained and released
    public static func from(data: Data, statusCode: Int) throws -> [Self] {
        if [400, 429].contains(statusCode) {
            let reason = try JSONDecoder().decode(OpenMeteoErorJson.self, from: data).reason
            throw OpenMeteoSdkError.error(message: reason)
        }
        if statusCode != 200 {
            throw OpenMeteoSdkError.serverError(statusCode: statusCode)
        }
        return getSizePrefixedMessages(bb: ByteBuffer(data: data))
    }
    
    /// Decode multiple size prefixed FlatBuffer messages from `Data`.
    /// Contents of data will be copied into a `ByteBuffer` and each message keeps a reference.
    /// Thus, memory will be correctly retrained and released
    public static func from(data: Data) -> [Self] {
        return getSizePrefixedMessages(bb: ByteBuffer(data: data))
    }
    
    /// Verify message, before decoding
    public static func getSizePrefixedMessagesAndVerify(bb: ByteBuffer) throws -> [Self] {
        var bb = bb
        var verifier = try Verifier(buffer: &bb)
        var results = [Self]()
        var position: Int32 = 0
        while position < bb.size {
            let length = bb.read(def: Int32.self, position: Int(position))
            let uoffset = bb.read(def: UOffset.self, position: Int(position) + 4)
            try Self.verify(&verifier, at: Int(position) + 4 + Int(uoffset), of: Self.self)
            let result = Self.init(bb, o: position + 4 + Int32(uoffset))
            results.append(result)
            position += length + 4
        }
        return results
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
