import Foundation

public extension String {

    /// Returns a new string with the first character capitalized.
    public func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }

    /// Capitalizes the first character of the string.
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

}
