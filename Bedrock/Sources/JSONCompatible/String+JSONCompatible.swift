import Foundation

extension String: JSONCompatible {

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
