#if canImport(UIKit)

import UIKit

public typealias PlatformViewController = UIViewController

#elseif canImport(AppKit)

import AppKit

public typealias PlatformViewController = NSViewController

#endif
