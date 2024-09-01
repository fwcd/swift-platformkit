import XCTest
@testable import PlatformKit

final class PlatformKitTests: XCTestCase {
    func testInstantiation() throws {
        _ = ExampleView()
        _ = ExampleViewController()
        _ = ExampleViewRepresentable()
        _ = ExampleViewControllerRepresentable()
    }
}
