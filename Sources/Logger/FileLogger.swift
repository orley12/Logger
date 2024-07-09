//
//  LoggerImpl.swift
//  Logger
//
//  Created by Oluwatosin Solarin on 07/07/2024.
//

import Foundation

public class FileLogger: Logger {
    private let fileManager = FileManager.default
    
    private var logDirectoryUrl: URL!
    public static var shared: FileLogger? {
        get {
            if instance == nil {
                instance = try? FileLogger()
            }
            return instance
        }
    }
    
    static private var instance: FileLogger? = try? FileLogger()
    
    private init() throws {
        logDirectoryUrl = try createLogDirectory()
    }
    
    public func log(error: String) throws {
        do {
            try error.write(to: logFileUrl, atomically: true, encoding: .utf8)
        } catch {
            throw LoggerError.write(error: "Failed to write to file: \(error.localizedDescription)")
        }
    }
    
    var logFileUrl: URL {
        return logDirectoryUrl.appendingPathComponent("\(Date().description(with: .current)).txt")
    }
    
    
    private func createLogDirectory() throws -> URL {
        do {
            let fileUrl = try buildLogDirectoryUrl()
            
            if !fileManager.fileExists(atPath: fileUrl.path) {
                
                try fileManager.createDirectory(at: fileUrl, withIntermediateDirectories: true, attributes: nil)
            }
                        
            return fileUrl
        } catch {
            throw LoggerError.fileCreation(error: "Failed to create file: \(error.localizedDescription)")
        }
    }
    
    private func buildLogDirectoryUrl() throws -> URL {
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw LoggerError.directory(error: "Failed to find the desktop directory.")
        }
        
        return documentsDirectory.appendingPathComponent("Logs")
    }
}
