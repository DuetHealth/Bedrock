import Foundation

public extension ClosedRange {

    /// Clamps values to this range.
    ///
    /// - Parameter value: the value to clamp.
    /// - Returns: a value greater than or equal to `lowerBound` and less than or equal to `upperBound`.
    public func clamp(_ value: Bound) -> Bound {
        if value < self.lowerBound { return self.lowerBound }
        if value > self.upperBound { return self.upperBound }
        return value
    }

}
