// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol Logger {
    func log(error: String) throws -> Void
}
