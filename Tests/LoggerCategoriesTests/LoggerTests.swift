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
import CoreGraphics

// Private token for this module to identify the bundle where this code is compiled.
private final class ModuleBundleToken {}
private let moduleSubsystem: String = Logging.subsystem(for: ModuleBundleToken.self)

enum LogCategory: String, LogCategoryType {
    case general

    public var name: String { self.rawValue }

    public var logger: Logger {
        Logger(subsystem: moduleSubsystem, category: rawValue)
    }
}

final class LoggerTests: XCTestCase {

    func testGeneralLog() {
	Logger.info("Test info.", LogCategory. general)
	Logger.trace("Test trace.", LogCategory. general)
	Logger.warning("Test warning.", LogCategory. general)
	Logger.error("Test error.", LogCategory. general)
	Logger.critical("Test critical.", LogCategory. general)
    }
}
