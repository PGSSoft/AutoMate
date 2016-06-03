//
//  Array.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

public extension Array where Element: LaunchArgumentValue {
    var launchArgument: String {
        return "(" + map({ $0.launchArgument }).joinWithSeparator(", ") + ")"
    }

    func combineValues<T: LaunchArgumentValue>(other: [T]) -> [LaunchArgumentValue] {
        var values = [LaunchArgumentValue]()
        forEach { values.append($0) }
        other.forEach { values.append($0) }
        return values
    }
}
