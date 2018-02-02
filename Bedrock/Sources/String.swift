import Foundation

public extension BedrockNamespace where Base == String {

    /// Returns a new string with the first character capitalized.
    public func capitalizingFirstLetter() -> String {
        let first = base.prefix(1).capitalized
        let other = base.dropFirst()
        return first + other
    }

}

public extension String {

    public var bedrock: BedrockNamespace<String> {
        return BedrockNamespace(base: self)
    }

}

