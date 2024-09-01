import SwiftUI

#if canImport(UIKit) && !os(watchOS)

public protocol PlatformViewControllerRepresentable: UIViewControllerRepresentable {
    associatedtype PlatformViewControllerType: UIViewController
    typealias Context = UIViewControllerRepresentableContext<Self>

    func makePlatformViewController(context: Context) -> PlatformViewControllerType
    
    func updatePlatformViewController(_ view: PlatformViewControllerType, context: Context)
}

public extension PlatformViewControllerRepresentable where PlatformViewControllerType == UIViewControllerType {
    func makeUIViewController(context: Context) -> PlatformViewControllerType {
        makePlatformViewController(context: context)
    }
    
    func updateUIViewController(_ view: PlatformViewControllerType, context: Context) {
        updatePlatformViewController(view, context: context)
    }
}

#elseif canImport(AppKit)

public protocol PlatformViewControllerRepresentable: NSViewControllerRepresentable {
    associatedtype PlatformViewControllerType: NSViewController
    typealias Context = NSViewControllerRepresentableContext<Self>

    func makePlatformViewController(context: Context) -> PlatformViewControllerType
    
    func updatePlatformViewController(_ view: PlatformViewControllerType, context: Context)
}

public extension PlatformViewControllerRepresentable where PlatformViewControllerType == NSViewControllerType {
    func makeNSViewController(context: Context) -> PlatformViewControllerType {
        makePlatformViewController(context: context)
    }
    
    func updateNSViewController(_ view: PlatformViewControllerType, context: Context) {
        updatePlatformViewController(view, context: context)
    }
}

#endif
