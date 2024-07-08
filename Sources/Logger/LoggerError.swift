//
//  LoggerError.swift
//  Logger
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

enum LoggerError: Error {
    case write(error: String)
    case directory(error: String)
    case fileCreation(error: String)
}
