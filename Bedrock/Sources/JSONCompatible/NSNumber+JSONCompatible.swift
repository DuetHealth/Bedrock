import Foundation

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
