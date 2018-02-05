//
//  NumberFormatterExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension NumberFormatter {

    /// Returns a string containing the formatted value of the provided number.
    ///
    /// - Parameter float: a `Numeric` that is parsed to create the returned string.
    /// - Returns: A string containing the formatted value of `number` using the receiver’s current settings.
    @nonobjc public func dhk_string<N: Numeric>(from number: N) -> String {
        return string(from: NSNumber(any: number)!)!
    }

}
