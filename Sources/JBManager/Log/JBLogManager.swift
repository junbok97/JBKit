//
//  LogManager.swift
//
//
//  Created by 이준복 on 8/23/24.
//

import Foundation
import os
import OSLog


extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier!
}

enum LogManager {
    
    enum Level {
        case `deinit`
        case debug
        case info
        case network
        case error
        case webView
        case custom(category: String)
        
        fileprivate var category: String {
            switch self {
            case .error:
                return "🔴 ERROR"
            case .info:
                return "🟠 INFO"
            case .debug:
                return "🟡 DEBUG"
            case .webView:
                return "🟢 WebView"
            case .network:
                return "🔵 NETWORK"
            case .deinit:
                return "🟣 Deinit"
            case .custom(let category):
                return "⚪️ \(category)"
            }
        }
    }
    
}


extension LogManager {
    
    static func log(level: Level = .debug, _ arguments: Any...) {
        log(arguments, level: level)
    }
    
    private static func log(_ arguments: [Any], level: Level) {
        let today = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let todayStr = formatter.string(from:today)
        
        let extraMessage: String = arguments.map({ String(describing: $0) }).joined(separator: " ")
        let logMessage = "\(level.category) \(todayStr) \(extraMessage)"

        let logger = Logger(subsystem: OSLog.subsystem, category: level.category)
        
        switch level {
        case .debug, .webView:
            logger.debug("\(logMessage, privacy: .public)")
        case .info:
            logger.info("\(logMessage, privacy: .public)")
        case .error:
            logger.error("\(logMessage, privacy: .public)")
        default:
            logger.log("\(logMessage, privacy: .public)")
        }
    }
    
}
