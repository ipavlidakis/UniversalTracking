import XCTest
@testable import UniversalTracking

final class UniversalTrackingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UniversalTracking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
