import SwiftUI

#if canImport(UIKit)

public protocol PlatformViewControllerRepresentable: UIViewControllerRepresentable {
    associatedtype PlatformViewControllerType: UIViewController
    typealias Context = UIViewControllerRepresentableContext<Self>

    func makePlatformViewController(context: Context) -> PlatformViewControllerType
    
    func updatePlatformViewController(_ view: PlatformViewControllerType, context: Context)
}

public extension PlatformViewControllerRepresentable where PlatformViewControllerType == UIViewControllerType {
    func makeUIView(context: Context) -> PlatformViewControllerType {
        makePlatformViewController(context: context)
    }
    
    func updateUIView(_ view: PlatformViewControllerType, context: Context) {
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
    func makeNSView(context: Context) -> PlatformViewControllerType {
        makePlatformViewController(context: context)
    }
    
    func updateNSView(_ view: PlatformViewControllerType, context: Context) {
        updatePlatformViewController(view, context: context)
    }
}

#endif
