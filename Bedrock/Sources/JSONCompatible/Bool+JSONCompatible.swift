import Foundation

extension Bool: JSONCompatible {

    public init?(any: Any?) {
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
            self.init(booleanLiteral: (a as NSString).boolValue)
        default:
            return nil
        }
    }

}
