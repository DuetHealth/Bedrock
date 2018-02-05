import Foundation

extension Date: JSONCompatible {

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
