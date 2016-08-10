//
//  Array.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

public extension Array where Element: LaunchArgumentValue {
    /// Elements of the array formatter as a launch argument.
    var launchArgument: String {
        return "(" + map({ $0.launchArgument }).joinWithSeparator(", ") + ")"
    }

    /**
     Combines together two arrays of objects implementing `LaunchArgumentValue` protocol.

     - note: This works different to `+` operation, because types of arrays may differ.
     - parameter other: Other array to use in join.
     - returns: Array of combined elements.
     */
    func combineValues<T: LaunchArgumentValue>(other: [T]) -> [LaunchArgumentValue] {
        var values = [LaunchArgumentValue]()
        forEach { values.append($0) }
        other.forEach { values.append($0) }
        return values
    }
}
