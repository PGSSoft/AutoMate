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

func asIdentifier(_ input: String) -> String {
    let range = NSRange(location: 0, length: input.characters.count)
    return identifierRegex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "")
}

func write(toFile name: String, block: (_ writer: Writer) -> Void) {
    func sourceDirectory() -> String {
        guard let directory = ProcessInfo.processInfo.environment["SRCROOT"] else {
            fatalError("Failed to determine source directory.")
        }

        return directory
    }

    let writer = Writer()
    block(writer)
    writer.write(to: sourceDirectory() + "/../AutoMate/Models/\(name).swift")
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

    func write(to path: String) {
        do {
            try data.write(toFile: path, options: [])
        } catch {
            fatalError("Failed to write:" + path)
        }

        print("Saved to " + path)
    }

    func append(line: String) {
        assert(!line.contains("\n"))

        var indented = ""
        // ignore indentation for empty lines
        if !line.isEmpty {
            for _ in 0..<indentation {
                indented += "    "
            }
        }
        indented += line + "\n"

        guard let dataFromString = indented.data(using: String.Encoding.utf8) else {
            return
        }
        data.append(dataFromString)
    }

    var debugDescription: String {
        guard let content = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) as? String else {
            fatalError()
        }
        return "Writer content:\n" + content
    }
}
