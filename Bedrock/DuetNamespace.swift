//
//  DuetNamespace.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

/// Encapsulates custom behaviors on views with a "proxy namespace" struct.
///
/// Any extensions to a type that could potentially conflict with other APIs, or extensions that are
/// highly situational, should be written as an extension to this type. Methods can then be called
/// similar to
/// ```
/// public override func viewDidLoad() {
/// ...
/// stackView.topAnchor.constraint(equalTo: duet.topAnchor).isActive = true
/// ...
/// }
/// ```
/// Note that in this example, the property `duet.topAnchor` is a case of highly situational behavior
/// and thus is rightly "namespaced".
///
/// You should not mix in functionality for `ObservableType`s with this namespace; instead, use the
/// `DuetRxNamespaceProxy` struct.
public struct DuetNamespace<Base> {

    let base: Base

    internal init(base: Base) {
        self.base = base
    }

}
