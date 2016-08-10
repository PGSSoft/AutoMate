//
//  Dictionary.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

extension Dictionary {

    /**
     Inserts element from another dictionary, removing old elements in case of matching keys.

     - parameter dictionary: dictionary to copy values from.
     */
    mutating func unionInPlace(dictionary: [Key: Value]) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }

    /**
     Inserts element from another dictionary, removing old elements in case of matching keys.

     - parameter dictionary: dictionary to copy elements from.
     - returns: Dictionary with merged elements.
     */
    func union(dictionary: [Key: Value]) -> [Key: Value] {
        var copy = self
        copy.unionInPlace(dictionary)
        return copy
    }
}
