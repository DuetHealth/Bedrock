import Foundation

public extension Dictionary where Value == Any {

    /// Attempts to convert the value in the dictionary to the argument type, falling back on the
    /// provided default value if the key does not exist in the dictionary or if conversion fails.
    public subscript<J: JSONCompatible>(_ key: Key, default value: J) -> J {
        return J.init(any: self[key]) ?? value
    }

    /// Attempts to convert a string in the dictionary to the argument raw representable type with
    /// that raw value. Returns `nil` if the key does not exist in the dictionary or if the value
    /// does not represent a valid raw value.
    public subscript<R: RawRepresentable>(raw key: Key) -> R? where R.RawValue == String {
        return String(any: self[key]).flatMap(R.init(rawValue:))
    }

    /// Attempts to convert a string in the dictionary to the argument raw representable type with
    /// that raw value, falling back on the provided default value if the key does not exist in the
    /// dictionary or if conversion fails.
    public subscript<R: RawRepresentable>(raw key: Key, default value: R) -> R where R.RawValue == String {
        return self[raw: key] ?? value
    }

}
