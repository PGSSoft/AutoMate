//
//  LaunchOptionsSet.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 30/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

/// Set for LaunchOption objects, using `uniqueIdentifier` property for hashing and comparision.
public struct LaunchOptionsSet {
    private var options: [LaunchOption]

    /// Create empty option set.
    public init() {
        options = []
    }
}

// MARK: SetAlgebraType
extension LaunchOptionsSet: SetAlgebraType {
    public typealias Element = LaunchOption

    /**
     Checks if set contains given element.
     - parameter member: Element to search for
     - returns: Boolean value indicating whether set contains given element.
     */
    public func contains(member: LaunchOption) -> Bool {
        return options.contains { $0.uniqueIdentifier == member.uniqueIdentifier }
    }

    /**
     Inserts given element (only if it isn't already in set).
     - parameter member: Element to insert.
     */
    public mutating func insert(member: LaunchOption) {
        if !contains(member) {
            options.append(member)
        }
    }

    /**
     Performs XOR operation.
     - parameter other: Set to combine with.
     - returns: Result of the operation.
     */
    public func exclusiveOr(other: LaunchOptionsSet) -> LaunchOptionsSet {
        var copy = self
        copy.exclusiveOrInPlace(other)
        return copy
    }

    /**
     Performs XOR operation.
     - parameter other: Set to combine with.
     */
    public mutating func exclusiveOrInPlace(other: LaunchOptionsSet) {
        var diff = options.filter { return !other.contains($0) }
        diff += other.filter { return !contains($0) }
        options = diff
    }

    /**
     Remove element from set.
     - parameter member: Element to remove.
     - returns: Removed element (or nil if it didn't exist).
     */
    public mutating func remove(member: LaunchOption) -> LaunchOption? {
        guard let index = options.indexOf({ member.uniqueIdentifier == $0.uniqueIdentifier }) else { return nil }
        return options.removeAtIndex(index)
    }

    /**
     Performs AND operation.
     - parameter other: Set to combine with.
     - returns: Result of the operation.
     */
    public func intersect(other: LaunchOptionsSet) -> LaunchOptionsSet {
        var copy = self
        copy.intersectInPlace(other)
        return copy
    }

    /**
     Performs AND operation.
     - parameter other: Set to combine with.
     */
    public mutating func intersectInPlace(other: LaunchOptionsSet) {
        options = options.filter { return other.contains($0) }
    }

    /**
     Performs OR operation.
     - parameter other: Set to combine with.
     - returns: Result of the operation.
     */
    public func union(other: LaunchOptionsSet) -> LaunchOptionsSet {
        var copy = self
        copy.unionInPlace(other)
        return copy
    }

    /**
     Performs OR operation.
     - parameter other: Set to combine with.
     */
    public mutating func unionInPlace(other: LaunchOptionsSet) {
        other.forEach({
            insert($0)
        })
    }
}

// MARK: SequenceType
extension LaunchOptionsSet: SequenceType {
    public typealias Generator = IndexingGenerator<[LaunchOption]>

    /**
     Creates generator for collection.
     - returns: Generator to walk over elements of the set.
     */
    public func generate() -> Generator {
        return options.generate()
    }
}

// MARK: Equatable
/**
 Compares whether two option sets contain the same elements.
 - parameter lhs: Compared element.
 - parameter rhs: Compared element.
 - returns: Result of the operation.
 */
public func == (lhs: LaunchOptionsSet, rhs: LaunchOptionsSet) -> Bool {
    return lhs.elementsEqual(rhs, isEquivalent: { $0.0.uniqueIdentifier == $0.1.uniqueIdentifier })
}
