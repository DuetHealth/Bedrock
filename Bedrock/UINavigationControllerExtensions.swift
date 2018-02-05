//
//  UINavigationControllerExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension UINavigationController {

    func dhk_pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping (() -> ())) {
        pushViewController(viewController, animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            completion()
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }

}
