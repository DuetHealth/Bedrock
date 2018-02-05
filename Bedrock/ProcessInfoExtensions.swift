//
//  ProcessInfoExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension ProcessInfo {

    public func isRunningTests() -> Bool {
        return environment["XCTestConfigurationFilePath"] != nil
    }

}
