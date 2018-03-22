import Foundation

precedencegroup ForwardPipePrecedence {
    associativity: left
    higherThan: BackwardPipePrecedence
    lowerThan: TernaryPrecedence
}

precedencegroup BackwardPipePrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
    lowerThan: TernaryPrecedence
}

infix operator |> : ForwardPipePrecedence

infix operator <| : BackwardPipePrecedence

/// Applies a value to a function.
///
/// - Parameters:
///   - lhs: the value to apply
///   - rhs: the function to which the value is applied
/// - Returns: the result of evaluating the function
public func |><T1, T2>(_ lhs: T1, _ rhs: (T1) -> T2) -> T2 {
    return rhs(lhs)
}

/// Applies a value to a function.
///
/// - Parameters:
///   - lhs: the function to which the value is applied
///   - rhs: the value to apply
/// - Returns: the result of evaluating the function
public func <|<T1, T2>(_ lhs: (T1) -> T2, _ rhs: T1) -> T2 {
    return lhs(rhs)
}
