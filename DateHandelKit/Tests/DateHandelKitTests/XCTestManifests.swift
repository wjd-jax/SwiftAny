import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DateHandelKitTests.allTests),
    ]
}
#endif
