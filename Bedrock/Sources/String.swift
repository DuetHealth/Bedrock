import Foundation

public extension RockNamespace where Base == String {

    /// Returns a new string with the first character capitalized.
    public func capitalizingFirstLetter() -> String {
        let first = base.prefix(1).capitalized
        let other = base.dropFirst()
        return first + other
    }

}

public extension String {

    public var rock: RockNamespace<String> {
        return RockNamespace(base: self)
    }

}

