import PlatformKit

struct ExampleViewRepresentable: PlatformViewRepresentable {
    func makePlatformView(context: Context) -> ExampleView {
        ExampleView()
    }

    func updatePlatformView(_ view: ExampleView, context: Context) {
        // Do nothing
    }
}

