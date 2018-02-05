//
//  Functions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

/// Logs a message to the console. Invocations of this function are removed for build configurations
/// other than DEBUG.
///
/// - Parameters:
///   - message: The message to log to the console.
public func debug(print message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        print("\(file.components(separatedBy: "/").last ?? file)[\(function)@\(line)] \(message)")
    #endif
}
