import Foundation

/// Encapsulates custom behaviors on types with a "proxy namespace" struct to avoid name conflicts.
/// Any definitions are called similar to
/// ```
/// (0..<4).duet.clamp(6)
/// ```
public struct BedrockNamespace<Base> {

    let base: Base

    internal init(base: Base) {
        self.base = base
    }

}

