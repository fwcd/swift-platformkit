import SwiftUI

#if canImport(UIKit)

public protocol PlatformViewRepresentable: UIViewRepresentable {
    associatedtype PlatformViewType: UIView
    typealias Context = UIViewRepresentableContext<Self>

    func makePlatformView(context: Context) -> PlatformViewType
    
    func updatePlatformView(_ view: PlatformViewType, context: Context)
}

public extension PlatformViewRepresentable where PlatformViewType == UIViewType {
    func makeUIView(context: Context) -> PlatformViewType {
        makePlatformView(context: context)
    }
    
    func updateUIView(_ view: PlatformViewType, context: Context) {
        updatePlatformView(view, context: context)
    }
}

#elseif canImport(AppKit)

public protocol PlatformViewRepresentable: NSViewRepresentable {
    associatedtype PlatformViewType: NSView
    typealias Context = NSViewRepresentableContext<Self>

    func makePlatformView(context: Context) -> PlatformViewType
    
    func updatePlatformView(_ view: PlatformViewType, context: Context)
}

public extension PlatformViewRepresentable where PlatformViewType == NSViewType {
    func makeNSView(context: Context) -> PlatformViewType {
        makePlatformView(context: context)
    }
    
    func updateNSView(_ view: PlatformViewType, context: Context) {
        updatePlatformView(view, context: context)
    }
}

#endif
