import Foundation

public extension RockNamespace where Base: Sequence {

    /// Partitions a sequence into two arrays corresponding with those elements which satisfy and do
    /// not satisfy the given predicate.
    ///
    /// - Parameter predicate: the predicate for which each element is evaluated
    /// - Returns: a tuple of satisfying and unsatisfying arrays of elements
    public func partition(_ predicate: (Base.Element) throws -> Bool) rethrows -> (satisfied: [Base.Element], unsatisfied: [Base.Element]) {
        var satisfied = [Base.Element]()
        var unsatified = [Base.Element]()
        for element in base {
            if try predicate(element) { satisfied.append(element) }
            else { unsatified.append(element) }
        }
        return (satisfied, unsatified)
    }

    /// Returns whether all elements in the sequence satisfy the given predicate.
    ///
    /// The empty sequence exhibits _vacuous truth_.
    ///
    /// - Parameter predicate: the predicate for which each element is evaluated
    /// - Returns: true if any only if all elements satisfy the predicate.
    public func all(_ predicate: (Base.Element) throws -> Bool) rethrows -> Bool {
        return try base.lazy.map(predicate).contains(false)
    }

    /// Returns whether any single element in the sequence satisfies the given predicate.
    ///
    /// - Parameter predicate: the predicate for which each element is evaluated
    /// - Returns: true if any element satisfies the predicate.
    public func any(_ predicate: (Base.Element) throws -> Bool) rethrows -> Bool {
        return try base.lazy.map(predicate).contains(true)
    }

}

public extension Sequence where Self.Element == Bool {

    /// Returns true if and only if the sequence does not contain `false`.
    public var all: Bool {
        return !self.contains(false)
    }

    /// Returns whether the sequence contains `true`.
    public var any: Bool {
        return self.contains(true)
    }

}

//
public extension Sequence {

    public var rock: RockNamespace<Self> {
        return RockNamespace(base: self)
    }

}
