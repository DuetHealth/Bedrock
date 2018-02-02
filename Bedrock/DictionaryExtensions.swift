//
//  DictionaryExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/2/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public protocol AnyInitializable {
    init?(any: Any?)
}

extension Double: AnyInitializable { }
extension Float: AnyInitializable { }
extension Int: AnyInitializable { }
extension String: AnyInitializable { }
extension URL: AnyInitializable { }

public extension Dictionary where Value == Any {

    public subscript<T: AnyInitializable>(_ key: Key, default value: T) -> T {
        return T.init(any: self[key]) ?? value
    }

    public subscript<R: RawRepresentable>(raw key: Key) -> R? where R.RawValue == String {
        return String(any: self[key]).flatMap(R.init(rawValue:))
    }

    public subscript<R: RawRepresentable>(raw key: Key, default value: R) -> R where R.RawValue == String {
        return self[raw: key] ?? value
    }

}
