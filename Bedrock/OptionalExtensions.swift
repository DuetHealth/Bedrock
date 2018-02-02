//
//  OptionalExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/2/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: Collection {

    /// Returns true if and if only there exists a wrapped collection and it does not contain elements.
    public var isEmpty: Bool {
        return self?.isEmpty ?? true
    }

    /// Returns true if and if only there exists a wrapped collection and it contains elements.
    public var isNotEmpty: Bool {
        return !isEmpty
    }

}
