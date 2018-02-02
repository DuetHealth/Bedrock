//
//  InitializerExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/2/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension String {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as String:
            self.init(a)
        case let a as Int:
            self.init(a)
        case let a as Bool:
            self.init(a)
        case let a as Float:
            self.init(a)
        case let a as Double:
            self.init(a)
        default:
            return nil
        }
    }

}

public extension Int {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as Int:
            self.init(a)
        case let a as Float:
            self.init(a)
        case let a as Double:
            self.init(a)
        case let a as String:
            self.init(a)
        case let a as Bool:
            self.init(a ? 1 : 0)
        default:
            return nil
        }
    }

}

public extension Double {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as Int:
            self.init(a)
        case let a as Double:
            self.init(a)
        case let a as Float:
            self.init(a)
        case let a as String:
            self.init(a)
        case let a as Bool:
            self.init(a ? 1 : 0)
        default:
            return nil
        }
    }

}

public extension Float {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as Float:
            self.init(a)
        case let a as Double:
            self.init(a)
        case let a as Int:
            self.init(a)
        case let a as String:
            self.init(a)
        case let a as Bool:
            self.init(a ? 1 : 0)
        default:
            return nil
        }
    }

}

public extension NSNumber {

    public convenience init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as Float:
            self.init(value: a)
        case let a as Int:
            self.init(value: a)
        case let a as Double:
            self.init(value: a)
        case let a as CGFloat:
            self.init(value: Float(a))
        case let a as Int8:
            self.init(value: a)
        case let a as Int16:
            self.init(value: a)
        case let a as Int32:
            self.init(value: a)
        case let a as Int64:
            self.init(value: a)
        case let a as UInt:
            self.init(value: a)
        case let a as UInt8:
            self.init(value: a)
        case let a as UInt16:
            self.init(value: a)
        case let a as UInt32:
            self.init(value: a)
        case let a as UInt64:
            self.init(value: a)
        default: return nil
        }
    }

}

public extension Bool {

    public init(any: Any?) {
        guard let a = any else {
            self.init(booleanLiteral: false)
            return
        }
        switch a {
        case let a as Bool:
            self.init(booleanLiteral: a)
        case let a as Int:
            self.init(booleanLiteral: a == 0 ? false : true)
        case let a as Float:
            self.init(booleanLiteral: a == 0 ? false : true)
        case let a as Double:
            self.init(booleanLiteral: a == 0 ? false : true)
        case let a as String:
            self.init(booleanLiteral: a.boolValueFromString)
        default:
            self.init(booleanLiteral: false)
        }
    }

}

public extension Date {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as Date:
            self.init(timeIntervalSince1970: a.timeIntervalSince1970)
        case let a as Double:
            self.init(timeIntervalSince1970: a)
        case let a as Float:
            self.init(timeIntervalSince1970: TimeInterval(a))
        case let a as Int:
            self.init(timeIntervalSince1970: TimeInterval(a))
        case let a as String:
            guard let timestamp = TimeInterval(any: a) else { return nil }
            self.init(timeIntervalSince1970: timestamp)
        default:
            return nil
        }
    }

}

public extension URL {

    public init?(any: Any?) {
        guard let a = any else { return nil }
        switch a {
        case let a as URL:
            self.init(string: a.absoluteString)
        case let a as String:
            self.init(string: a)
        case let a as Double:
            self.init(string: String(a))
        case let a as Int:
            self.init(string: String(a))
        default:
            return nil
        }
    }

}
