import XCTest
@testable import LanguageKit

final class LanguageKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LanguageKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
