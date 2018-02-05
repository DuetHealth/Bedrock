//
//  OpenRange.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

infix operator .<.<: RangeFormationPrecedence

/// Creates a new open range using the open range operator (`.<.<`).
///
/// - Parameters:
///   - lower: the lower bound of the range
///   - upper: the upper bound of the range
/// - Returns: an open range that does not contain its lower nor its upper bounds.
public func .<.<<Bound>(_ lower: Bound, _ upper: Bound) -> OpenRange<Bound> {
    return OpenRange(uncheckedBounds: (lower, upper))
}

/// An interval over a comparable type whose lower and upper bounds are not included.
///
/// You create an `OpenRange` instance by using the open range operator (`.<.<`):
/// ```
/// let positiveDoubles = 0.0.<.<Double.greatestFiniteMagnitude
/// ```
///
/// An `OpenRange` instance contains neither its lower bound nor its upper bound.
/// ```
/// print(positiveDoubles.contains(0))                                 // Prints "false"
/// print(positiveDoubles.contains(543.432))                           // Prints "true"
/// print(positiveDoubles.contains(Double.greatestFiniteMagnitude))    // Prints "false"
/// ```
public struct OpenRange<Bound: Comparable> {

    public let lowerBound: Bound
    public let upperBound: Bound

    public init(uncheckedBounds: (Bound, Bound)) {
        lowerBound = uncheckedBounds.0
        upperBound = uncheckedBounds.1
        guard lowerBound <= upperBound else {
            fatalError("\(lowerBound).<.<\(upperBound) does not represent a valid open range. The lower bound must be less than or equal to the upper bound.")
        }
    }

    public func contains(_ value: Bound) -> Bool {
        return value > lowerBound && value < upperBound
    }

}
