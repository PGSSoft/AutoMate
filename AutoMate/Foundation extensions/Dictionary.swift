//
//  Dictionary.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

extension Dictionary {
    mutating func unionInPlace(dictionary: [Key: Value]) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }

    func union(dictionary: [Key: Value]) -> [Key: Value] {
        var copy = self
        copy.unionInPlace(dictionary)
        return copy
    }
}
