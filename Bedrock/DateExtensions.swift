//
//  DateExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

extension Date {
    public var timestamp: Int {
        get {
            return Int(timeIntervalSince1970)
        }
    }
}
