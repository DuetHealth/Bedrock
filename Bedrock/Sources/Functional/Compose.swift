import Foundation

precedencegroup CompositionPrecedence {
    associativity: right
    higherThan: BitwiseShiftPrecedence
}

infix operator • : CompositionPrecedence

/// Returns a function evaluated by applying a value to the right-hand argument and using that result
/// to evaluate the left-hand function.
public func •<T1, T2, T3>(_ lhs: @escaping (T2) -> T3, _ rhs: @escaping (T1) -> T2) -> (T1) -> T3 {
    return { $0 |> rhs |> lhs }
}
