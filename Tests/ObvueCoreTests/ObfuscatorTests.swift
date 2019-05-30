@testable import ObvueCore
import XCTest

final class ObfuscatorTests: XCTestCase {
    func test_random_count() throws {
        let subject = Obfuscator([1,2,3,4]).random.count
        let expectation = 4
        XCTAssertEqual(subject, expectation)
    }

    func test_obfuscated_count() throws {
        let subject = Obfuscator([1,2,3,4]).obfuscated.count
        let expectation = 8
        XCTAssertEqual(subject, expectation)
    }

    func test_deobfuscated_count() throws {
        let dependency = Obfuscator([1,2,3,4]).obfuscated
        let subject: [UInt8] = Obfuscator.deobfuscate(obfuscated: dependency)
        let expectation = 4
        XCTAssertEqual(subject.count, expectation)
    }

    func test_deobfuscate() throws {
        let expectation: [UInt8] = [1,2,3,4]
        let subject: [UInt8] = Obfuscator.deobfuscate(obfuscated: Obfuscator(expectation).obfuscated)

        XCTAssertEqual(subject, expectation)
    }

    func test_deobfuscate_string() throws {
        let expectation = "asdf1234"
        guard let subject: String = Obfuscator.deobfuscate(obfuscated: Obfuscator(expectation).obfuscated) else {
            XCTFail("Could not created subject")
            return
        }

        XCTAssertEqual(subject, expectation)
    }

    static var allTests = [
        ("test_random_count", test_random_count),
        ("test_obfuscated_count", test_obfuscated_count),
        ("test_deobfuscated_count", test_deobfuscated_count),
        ("test_deobfuscate", test_deobfuscate),
        ("test_deobfuscate_string", test_deobfuscate_string),
    ]
}
