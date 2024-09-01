#if canImport(UIKit)

import UIKit

public typealias PlatformImage = UIImage

#elseif canImport(AppKit)

import AppKit

public typealias PlatformImage = NSImage

public extension NSImage {
    @available(macOS 11, *)
    convenience init(systemName: String) {
        self.init(systemSymbolName: systemName, accessibilityDescription: nil)!
    }
}

#endif
