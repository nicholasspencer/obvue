import XCTest

import obvueTests
import ObvueCoreTests

var tests = [XCTestCaseEntry]()
tests += obvueTests.allTests()
tests += ObvueCoreTests.allTests()
XCTMain(tests)
