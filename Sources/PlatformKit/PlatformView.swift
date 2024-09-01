#if canImport(UIKit) && !os(watchOS)

import UIKit

public typealias PlatformView = UIView

#elseif canImport(AppKit)

import AppKit

public typealias PlatformView = NSView

#endif
