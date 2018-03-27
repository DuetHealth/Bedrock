import Foundation

/// Returns the first element of a two-element tuple.
///
/// - Parameter tuple: the argument tuple
/// - Returns: the argument tuple's first element.
public func fst<T1, T2>(_ tuple: (T1, T2)) -> T1 {
    return tuple.0
}

/// Returns the second element of a two-element tuple.
///
/// - Parameter tuple: the argument tuple
/// - Returns: the argument tuple's second element.
public func snd<T1, T2>(_ tuple: (T1, T2)) -> T2 {
    return tuple.1
}

/// Swaps the positions of elements of a two-element tuple.
///
/// - Parameter tuple: the argument tuple
/// - Returns: a new tuple of `(tuple.1, tuple.0)`.
public func swap<T1, T2>(_ tuple: (T1, T2)) -> (T2, T1) {
    return (tuple.1, tuple.0)
}

/// Creates a two-element tuple from the given arguments.
public func tuple<T1, T2>(_ t1: T1, _ t2: T2) -> (T1, T2) {
    return (t1, t2)
}

/// Creates a three-element tuple from the given arguments.
public func tuple<T1, T2, T3>(_ t1: T1, _ t2: T2, _ t3: T3) -> (T1, T2, T3) {
    return (t1, t2, t3)
}

/// Creates a four-element tuple from the given arguments.
public func tuple<T1, T2, T3, T4>(_ t1: T1, _ t2: T2, _ t3: T3, _ t4: T4) -> (T1, T2, T3, T4) {
    return (t1, t2, t3, t4)
}

/// Creates a five-element tuple from the given arguments.
public func tuple<T1, T2, T3, T4, T5>(_ t1: T1, _ t2: T2, _ t3: T3, _ t4: T4, _ t5: T5) -> (T1, T2, T3, T4, T5) {
    return (t1, t2, t3, t4, t5)
}
