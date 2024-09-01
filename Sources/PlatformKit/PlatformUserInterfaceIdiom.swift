public enum PlatformUserInterfaceIdiom: Hashable {
    case phone
    case pad
    case tv
    case carPlay
    case mac
    case vision
    case watch
    case unspecified
}

#if os(watchOS)

public extension PlatformUserInterfaceIdiom {
    static var current: Self { .watch }
}

#elseif canImport(UIKit)

import UIKit

public extension PlatformUserInterfaceIdiom {
    static var current: Self { Self(UIDevice.current.userInterfaceIdiom) }

    init(_ idiom: UIUserInterfaceIdiom) {
        switch idiom {
        case .phone: self = .phone
        case .pad: self = .pad
        case .tv: self = .tv
        case .carPlay: self = .carPlay
        case .mac: self = .mac
        case .vision: self = .vision
        case .unspecified: self = .unspecified
        @unknown default: self = .unspecified
        }
    }
}

#elseif canImport(AppKit)

import AppKit

public extension PlatformUserInterfaceIdiom {
    static var current: Self { .mac }
}

#endif
