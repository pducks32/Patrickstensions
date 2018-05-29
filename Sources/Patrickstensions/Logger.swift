//
//  Logger.swift
//  Patrickstensions
//
//  Created by Patrick Metcalfe on 5/29/18.
//

import Foundation

public class Logger {
    public enum Severity : String {
        case warning = "🧡"
        case fatal = "💔"
        case info = "💙"
        case debug = "💚"
    }
    
    public static let `default` = Logger()
    
    public func log(severity : Severity, message : Any) {
        print(severity.rawValue + " " + String(describing: message))
    }
    
    public func warn(_ message : Any) {
        log(severity: .warning, message: message)
    }
    
    public func fatal(_ message : Any) -> Never {
        log(severity: .fatal, message: message)
        fatalError(String(describing: message))
    }
    
    public func info(_ message : Any) {
        log(severity: .info, message: message)
    }
    
    public func debug(_ message : Any) {
        log(severity: .debug, message: message)
    }
    
    public func todo<T>(_ object : T, fn : StaticString = #function, file : StaticString = #file) -> T {
        warn("Todo value used in function \(fn) in file (\(file)")
        return object
    }
    
    public func require<T>(_ possible : T?, fn :  StaticString = #function) -> T {
        guard let object = possible else {
            self.fatal("Requirement failure in function \(fn)")
        }
        return object
    }
}
