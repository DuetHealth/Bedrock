import Foundation

public extension BedrockNamespace where Base: Bundle {

    /// Deserializes a JSON object. Will crash if file doesn't exist, is not a JSON object, is
    /// malformed, or is in a different bundle.
    ///
    /// - Parameters
    ///   - fileName: The name of the file to be loaded
    /// - Returns: A swift dictionary from the JSON in the file
    public func deserializeJSON(fileName: String) -> [String: Any] {
        let url = base.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONSerialization.jsonObject(with: data) as! [String: Any]
    }

}

public extension Bundle {

    public convenience init<Caller: AnyObject>(of caller: Caller) {
        self.init(for: type(of: caller))
    }

    public var bedrock: BedrockNamespace<Bundle> {
        return BedrockNamespace(base: self)
    }

}
