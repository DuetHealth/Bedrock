//
//  ReuseQueueExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/5/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

@inline(__always) fileprivate func fullyQualifiedName(of type: AnyClass) -> String {
    let bundle = Bundle(for: type).bundleIdentifier ?? Bundle.main.bundleIdentifier!
    return "\(bundle).\(String(describing: type))"
}

public extension UITableView {

    /// Registers a number of classes for use in creating new table cells.
    ///
    /// - Parameter cells: The classes of cells that you want to use in the table.
    public func dhk_register(cells: AnyClass...) {
        cells.map { type in (type, fullyQualifiedName(of: type)) }
            .forEach(register(_:forCellReuseIdentifier:))
    }

    /// Returns a reusable table view cell of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `dhk_register(cells:)`, otherwise
    /// this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// tableView.register(MobilePhoneCell.self, EmailCell.self, WebsiteCell.self)
    /// ...
    ///
    /// // In tableView(_: cellForRowAt:)
    /// ...
    /// let cell: EmailCell = tableView.dequeueReusableCell(at: indexPath)
    /// cell.emailCellBehavior()
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    public func dequeueReusableCell<Cell>(at indexPath: IndexPath) -> Cell where Cell: UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: fullyQualifiedName(of: Cell.self), for: indexPath) as! Cell
    }

}

public extension UICollectionView {

    /// Registers a number of classes for use in creating new collection cells.
    ///
    /// - Parameter cells: The classes of cells that you want to use in the collection view.
    public func dhk_register(cells: AnyClass...) {
        cells.map { type in (type, fullyQualifiedName(of: type)) }
            .forEach(register(_:forCellWithReuseIdentifier:))
    }

    /// Registers a class for use in creating new collection view supplementary views.
    ///
    /// - Parameters:
    ///   - supplement: The class of view that you want to use in the collection view.
    ///   - kind: The kind of supplementary view with which the collection view should associate the class.
    public func dhk_register(supplement: AnyClass, kind: String) {
        register(supplement, forSupplementaryViewOfKind: kind, withReuseIdentifier: fullyQualifiedName(of: supplement))
    }

    /// Returns a reusable collection view cell of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `dhk_register(cells:)`, otherwise
    /// this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// collectionView.dhk_register(MobilePhoneCell.self, EmailCell.self, WebsiteCell.self)
    /// ...
    ///
    /// // In collectionView(_: cellForRowAt:)
    /// ...
    /// let cell: PictureCell = collectionView.dequeueReusableCell(at: indexPath)
    /// cell.setLikeCounter(to: 5)
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    public func dequeueReusableCell<Cell>(at indexPath: IndexPath) -> Cell where Cell: UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: fullyQualifiedName(of: Cell.self), for: indexPath) as! Cell
    }

    /// Returns a reusable supplementary view of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `dhk_register(supplement:kind:)`,
    /// otherwise this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// collectionView.dhk_register(PictureCell.self, StatusCell.self)
    /// ...
    ///
    /// // In collectionView(_: cellForRowAt:)
    /// ...
    /// let cell: PictureCell = collectionView.dequeueReusableCell(at: indexPath)
    /// cell.setLikeCounter(to: 5)
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    public func dequeueSupplementaryView<View>(kind: String, at indexPath: IndexPath) -> View where View: UICollectionReusableView {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: fullyQualifiedName(of: View.self), for: indexPath) as! View
    }

}
