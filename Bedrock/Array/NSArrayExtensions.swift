//
//  NSArrayExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension NSArray {

    /// Returns whether at least one element of this array satisfies the given predicate.
    ///
    /// - Parameter predicate: a closure which evaluates some condition given an element.
    /// - Returns: true if and only if the predicate is satisfied by at least one element.
    @objc public func duet_any(_ predicate: (Element) -> Bool) -> Bool {
        return self.first(where: predicate) != nil
    }

    /// Returns whether all elements of this array satisfy the given predicate.
    ///
    /// - Parameter predicate: a closure which evaluates some condition given an element.
    /// - Returns: true if and only if the predicate is satisfied by all elements.
    @objc public func duet_all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) { return false }
        }
        return true
    }

    /// Projects each element of this array into a new form using the given closure.
    ///
    /// - Parameter closure: a closure which transforms an element into a new form.
    /// - Returns: a new array of the projected type.
    @objc public func duet_map(_ closure: (Element) -> Any) -> NSArray {
        return self.map(closure) as NSArray
    }

    /// Returns the first element which satisfies the given predicate or `nil` if no element does so.
    ///
    /// - Parameter predicate: a closure which evaluates some condition given an element.
    /// - Returns: the first satisfying element or nil if none do so.
    @objc public func duet_first(_ predicate: (Element) -> Bool) -> Element? {
        return self.first(where: predicate)
    }

    /// Filters the elements of this array which satisfy the given predicate.
    ///
    /// - Parameter predicate: a closure which evaluates some condition given an element.
    /// - Returns: an array containing only elements which satisfy the predicate.
    @objc public func duet_filter(_ predicate: (Element) -> Bool) -> NSArray {
        return self.filter(predicate) as NSArray
    }

    public typealias Aggregate = Any
    @objc public func duet_reduce(_ start: Aggregate, _ fold: (Aggregate, Element) -> Aggregate) -> Aggregate {
        return self.reduce(start, fold)
    }

}
