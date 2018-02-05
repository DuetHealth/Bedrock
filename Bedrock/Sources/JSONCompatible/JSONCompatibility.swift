import Foundation

/// Types which conform to the `JSONCompatible` protocol can be conveniently initialized from a
/// dynamically-typed dictionary corresponding to the Swift representation for JSON objects.
public protocol JSONCompatible {

    /// Creates and returns a new instance of the type from a dynamically-typed value.
    init?(any: Any?)

}
