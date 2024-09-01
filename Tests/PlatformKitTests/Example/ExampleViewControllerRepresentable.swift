import PlatformKit

struct ExampleViewControllerRepresentable: PlatformViewControllerRepresentable {
    func makePlatformViewController(context: Context) -> ExampleViewController {
        ExampleViewController()
    }

    func updatePlatformViewController(_ view: ExampleViewController, context: Context) {
        // Do nothing
    }
}
