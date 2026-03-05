=//===----------------------------------------------------------------------===//
//
// This source file is part of the LoggerCategories open source project
//
// Copyright (c) 2026 David C. Vasquez and the LoggerCategories project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See the project's LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import OSLog
import Foundation

/// A protocol for Logger categories.
public protocol LogCategoryType {
    var name: String { get }
    var logger: Logger { get }
}

public enum Logging {
    public static func subsystem(for typeInModule: AnyClass) -> String {
        let bundleID =
            Bundle(for: typeInModule).bundleIdentifier
            ?? Bundle.main.bundleIdentifier
            ?? "com.fallback.logger"

#if DEBUG
        return "dev.\(bundleID)"
#else
        return bundleID
#endif
    }
}

/// Extension to Logger with wrappers for each type of log entry.
public extension Logger {
    static func info<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.info("ℹ️ Info • \(header) • \(message)")
    }

    static func trace<Category: LogCategoryType>(
        _ message: String = "",
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.trace("🔎 Trace • \(header) • \(message)")
    }

    static func debug<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.debug("🔧 Debug • \(header) • \(message)")
    }

    static func warning<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.warning("⚠️ Warning • \(header) • \(message)")
    }

    static func error<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.error("⧱ Error ⧯ \(header) • \(message)")
    }

    static func critical<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.critical("💣 CRITICAL ⏛ \(header) • \(message)")
    }

    static func fault<Category: LogCategoryType>(
        _ message: String,
        fileID: String = #fileID,
        function: String = #function,
        line: Int = #line,
        threadDescription: String = Thread.current.description,
        _ category: Category
    ) -> Never {
        let header = header(
            category: category.name,
            fileID: fileID, function: function, line: line,
            threadDescription: threadDescription)
        category.logger.fault("🛑 FAULT • \(header) • \(message)")

        // Unconditionally stops execution.
        fatalError("End of line.")
    }

    private static func header(
        category: String,
        fileID: String, function: String, line: Int,
        threadDescription: String
    ) -> String {
        "\(category) [\(fileID):\(line)] \(function) | \(threadDescription)"
    }
}
