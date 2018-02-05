//
//  ArrayExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

@objc public protocol Layoutable {}
extension UILayoutGuide: Layoutable {}
extension UIView: Layoutable {}

public extension Array where Element == NSLayoutConstraint {

    /// Creates and returns an array of `NSLayoutConstraint`.
    ///
    /// This function is identical to `NSLayoutConstraint`--it is merely more succinct.
    public static func visualFormat(_ format: String, metrics: [String: CGFloat] = [:], views: [String: Any]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: format, metrics: metrics, views: views)
    }

    /// Creates and returns an array of `NSLayoutConstraint` applied to a number of views. View names
    /// are automatically assigned as _vn_ according to the zero-indexed order in which they are supplied:
    /// ```
    /// let label = UILabel()
    /// ...
    /// let button = UIButton()
    /// ...
    /// let constraints = .visualFormat("V:|-[v0]-[v1]-|", label, button)
    /// NSLayoutConstraint.activate(constraints)
    /// ```
    public static func visualFormat(_ format: String, metrics: [String: CGFloat] = [:], views: Layoutable...) -> [NSLayoutConstraint] {
        let viewDictionary = Dictionary.init(pairs: views.enumerated().map { (offset, element) -> (String, Any) in
            return ("v\(offset)", element)
        })

        return NSLayoutConstraint.constraints(withVisualFormat: format, metrics: metrics, views: viewDictionary)
    }
}

// TODO: Once converted to Swift 4, this extension can be removed and replaced with the Foundation implementation.
public extension Dictionary {

    init(pairs: [(key: Key, value: Value)]) {
        self.init()
        pairs.forEach { pair in
            self[pair.key] = pair.value
        }
    }

}
