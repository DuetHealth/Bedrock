import Foundation

public extension Optional where Wrapped: Collection {

    /// Returns true if and if only there exists a wrapped collection and it does not contain elements.
    public var lacksElements: Bool {
        return self?.isEmpty ?? true
    }

    /// Returns true if and if only there exists a wrapped collection and it contains elements.
    public var hasElements: Bool {
        return !lacksElements
    }

}
