import SwiftUI

#if canImport(UIKit) && !os(watchOS)

@MainActor public protocol PlatformViewControllerRepresentable: UIViewControllerRepresentable {
    associatedtype PlatformViewControllerType: UIViewController
    typealias Context = UIViewControllerRepresentableContext<Self>

    @MainActor func makePlatformViewController(context: Context) -> PlatformViewControllerType
    
    @MainActor func updatePlatformViewController(_ view: PlatformViewControllerType, context: Context)
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

@MainActor public protocol PlatformViewControllerRepresentable: NSViewControllerRepresentable {
    associatedtype PlatformViewControllerType: NSViewController
    typealias Context = NSViewControllerRepresentableContext<Self>

    @MainActor func makePlatformViewController(context: Context) -> PlatformViewControllerType
    
    @MainActor func updatePlatformViewController(_ view: PlatformViewControllerType, context: Context)
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
