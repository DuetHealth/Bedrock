//
//  UIAccessibilityExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension UIView {

    /// Sets the accessibility label of this element as a composed body of labels.
    /// You may use this method for views which could provide composite information
    /// to accessibility users, such as `UITableViewCell`s.
    ///
    /// - Parameter labels: the list of labels from which the composite accessibility label is built.
    public func dhk_composeAccessibilityLabel(from labels: [String]) {
        assert(labels.count >= 1, "Cannot build a composite label from zero child labels.")
        self.accessibilityLabel = labels.joined(separator: "; ")
    }

}
