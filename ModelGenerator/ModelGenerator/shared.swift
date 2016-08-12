//
//  Writer.swift
//  ModelGenerator
//
//  Created by Pawel Szot on 12/08/16.
//  Copyright © 2016 PSZOT. All rights reserved.
//

import Foundation

private let identifierRegex: NSRegularExpression = {
    let regex = "\\W+"
    guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
        preconditionFailure("Couldn't initialize expression with given pattern")
    }
    return expr
}()

func asIdentifier(input: String) -> String {
    let range = NSRange(location: 0, length: input.characters.count)
    return identifierRegex.stringByReplacingMatchesInString(input, options: [], range: range, withTemplate: "")
}

func write(name: String, @noescape block: (writer: Writer) -> ()) {
    func sourceDirectory() -> String {
        guard let directory = NSProcessInfo.processInfo().environment["SRCROOT"] else {
            fatalError("Failed to determine source directory.")
        }

        return directory
    }

    let writer = Writer()
    block(writer: writer)
    writer.write(sourceDirectory() + "/../AutoMate/Models/\(name).swift")
}

/// Helper for generating source code.
class Writer: CustomDebugStringConvertible {
    private let data = NSMutableData()
    private var indentation = 0

    func beginIndent() {
        indentation += 1
    }

    func finishIndent() {
        indentation -= 1
    }

    func write(path: String) {
        do {
            try data.writeToFile(path, options: [])
        } catch {
            fatalError("Failed to write:" + path)
        }

        print("Saved to " + path)
    }

    func append(line line: String) {
        assert(!line.containsString("\n"))

        var indented = ""
        // ignore indentation for empty lines
        if !line.isEmpty {
            for _ in 0..<indentation {
                indented += "    "
            }
        }
        indented += line + "\n"

        guard let dataFromString = indented.dataUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        data.appendData(dataFromString)
    }

    var debugDescription: String {
        guard let content = NSString(data: data, encoding: NSUTF8StringEncoding) as? String else {
            fatalError()
        }
        return "Writer content:\n" + content
    }
}
