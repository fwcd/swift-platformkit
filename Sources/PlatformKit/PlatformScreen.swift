#if canImport(UIKit) && !os(watchOS) && !os(visionOS)

import UIKit

public typealias PlatformScreen = UIScreen

#elseif canImport(AppKit)

import AppKit

public typealias PlatformScreen = NSScreen

public extension NSScreen {
    var scale: CGFloat {
        backingScaleFactor
    }
}

#endif
