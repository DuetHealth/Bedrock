import Foundation

public extension Bundle {

    /// Deserializes a JSON object. Will crash if file doesn't exist, is not a JSON object, is
    /// malformed, or is in a different bundle.
    ///
    /// - Parameters
    ///   - fileName: The name of the file to be loaded
    /// - Returns: A swift dictionary from the JSON in the file
    public func deserializeJSON(fileName: String) -> [String: Any] {
        let url = self.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONSerialization.jsonObject(with: data) as! [String: Any]
    }

}
