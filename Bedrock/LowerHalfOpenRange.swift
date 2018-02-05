//
//  LowerHalfOpenRange.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

infix operator .<..: RangeFormationPrecedence

/// Creates a new lower-half open range using the lower-half open range operator (`.<..`).
///
/// - Parameters:
///   - lower: the lower bound of the range
///   - upper: the upper bound of the range
/// - Returns: an open range that does not contain its lower bound but contains its upper bounds.
public func .<..<Bound>(_ lhs: Bound, _ rhs: Bound) -> LowerHalfOpenRange<Bound> {
    return LowerHalfOpenRange(uncheckedBounds: (lhs, rhs))
}

/// An interval over a comparable type whose lower bound is not included and upper bound is included.
///
/// You create a `LowerHalfOpenRange` instance by using the lower-half open range operator (`.<..`):
/// ```
/// let validDenominators = 0.0.<..Double.greatestFiniteMagnitude
/// ```
///
/// A `LowerHalfOpenRange` instance does not contain its lower bound but does contain its upper bound.
/// ```
/// print(positiveDoubles.contains(0))                                 // Prints "false"
/// print(positiveDoubles.contains(543.432))                           // Prints "true"
/// print(positiveDoubles.contains(Double.greatestFiniteMagnitude))    // Prints "true"
/// ```
public struct LowerHalfOpenRange<Bound: Comparable> {

    public let lowerBound: Bound
    public let upperBound: Bound

    public init(uncheckedBounds: (Bound, Bound)) {
        lowerBound = uncheckedBounds.0
        upperBound = uncheckedBounds.1
        guard lowerBound <= upperBound else {
            fatalError("\(lowerBound).<..\(upperBound) does not represent a valid open range. The lower bound must be less than or equal to the upper bound.")
        }
    }

    public func contains(_ value: Bound) -> Bool {
        guard lowerBound != upperBound else { return value == upperBound }
        return value > lowerBound && value <= upperBound
    }

}
