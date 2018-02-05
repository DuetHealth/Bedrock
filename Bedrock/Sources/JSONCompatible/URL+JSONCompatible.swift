import Foundation

extension URL: JSONCompatible {

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
