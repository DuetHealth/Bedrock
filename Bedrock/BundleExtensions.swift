//
//  BundleExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension Bundle {

    /// Forces loading JSON from a file as a Dictionary. Will crash if file doesn't exist, is malformed, or is in a different bundle.
    ///
    /// - Parameters
    ///   - fileName: The name of the file to be loaded
    /// - Returns: A swift dictionary from the JSON in the file
    public func dhk_dictionaryFromJSONFile(_ fileName: String) -> [AnyHashable: Any] {
        let url = self.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONSerialization.jsonObject(with: data) as! [AnyHashable: AnyObject]
    }

}
