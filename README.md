# LoggerCategories

[![Swift](https://github.com/davidcvasquez/LoggerCategories/actions/workflows/swift.yml/badge.svg)](https://github.com/davidcvasquez/LoggerCategories/actions/workflows/swift.yml)

A protocol for custom `Logger` categories, with an extension to `Logger` that provides wrappers for each type of log entry.

## Details

The LoggerCategories library provides wrappers for the following types of `Logger` calls\:

- `trace`
- `debug`
- `info`
- `notice`
- `warning`
- `error`
- `critical`
- `fault`

The `LogCategoryType` protocol enables modules and apps to provide their own enum with categories for each of the types of `Logger` calls.

## Usage

Provide a custom enum with your module or app categories as shown below\:

```
import OSLog
import LoggerCategories

// Private token for this module to identify the bundle where this code is compiled.
private final class ModuleBundleToken {}
private let moduleSubsystem: String = Logging.subsystem(for: ModuleBundleToken.self)

enum LogCategory: String, LogCategoryType {
    case general, view, model, viewmodel, localization, network

    public var name: String { self.rawValue }

    public var logger: Logger {
        Logger(subsystem: moduleSubsystem, category: rawValue)
    }
}
```

Call `Logger` with a custom category as follows\:
```
Logger.info("This is just info.", LogCategory.general)
```

## Supported Versions

The minimum Swift version supported by LoggerCategories is 5.9.
