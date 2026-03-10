//===----------------------------------------------------------------------===//
//
// This source file is part of the LoggerCategories open source project
//
// Copyright (c) 2026 David C. Vasquez and the LoggerCategories project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See the project's LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import XCTest
import LoggerCategories
import OSLog

// Private token for this module to identify the bundle where this code is compiled.
private final class ModuleBundleToken {}
private let moduleSubsystem: String = Logging.subsystem(for: ModuleBundleToken.self)

/// Apps and modules define their own list of categories as an internal `LogCategory` enum.
enum LogCategory: String, LogCategoryType {
    case general

    public var name: String { self.rawValue }

    public var logger: Logger {
        Logger(subsystem: moduleSubsystem, category: rawValue)
    }
}

final class LoggerTests: XCTestCase {

    func testGeneralCategoryLog() {
        Logger.trace("Test trace.", LogCategory.general)
        Logger.debug("Test debug.", LogCategory.general)
        Logger.info("Test info.", LogCategory.general)
        Logger.notice("Test notice.", LogCategory.general)
        Logger.warning("Test warning.", LogCategory.general)
        Logger.error("Test error.", LogCategory.general)
        Logger.critical("Test critical.", LogCategory.general)
        Logger.fault("Test fault.", LogCategory.general)
    }
}
