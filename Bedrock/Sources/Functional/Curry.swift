import Foundation

/// Transforms a function from a function of a tuple into a "series of functions" of those tuple's components.
///
/// - Parameter function: the function to curry
/// - Returns: the argument function in curried form.
public func curry<T1, T2, T3>(_ function: @escaping (T1, T2) -> T3) -> (T1) -> (T2) -> T3 {
    return { t1 in { t2 in function(t1, t2) } }
}

/// Transforms a function from a "series of functions" into a function of a tuple with components
/// corresponding to the "intermediate" functions' arguments.
///
/// - Parameter function: the function to uncurry
/// - Returns: the argument function in uncurried form.
public func uncurry<T1, T2, T3>(_ function: @escaping (T1) -> (T2) -> T3) -> (T1, T2) -> T3 {
    return { function($0)($1) }
}

/// Transforms a function of a tuple to a function of that tuple swapped.
///
/// - Parameter function: the function to transform
/// - Returns: a function whose arguments with respect to the argument function are swapped.
public func rot<T1, T2, T3>(_ function: @escaping (T1, T2) -> T3) -> (T2, T1) -> T3 {
    return { function($1, $0) }
}
