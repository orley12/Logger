//
//  Logger.swift
//  Logger
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

public protocol Logger {
    func log(error: String) throws -> Void
}
