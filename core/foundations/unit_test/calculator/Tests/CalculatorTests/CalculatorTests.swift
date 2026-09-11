import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    func testAddition() {
        XCTAssertEqual(Calculator.addition(2, 3), 5)
    }

    func testSubtraction() {
        XCTAssertEqual(Calculator.subtraction(5, 2), 3)
    }

    func testMultiplication() {
        XCTAssertEqual(Calculator.multiplication(3, 4), 12)
    }

    func testDivision() {
        XCTAssertEqual(Calculator.division(10, 3), 3)
    }

    func testModulus() {
        XCTAssertEqual(Calculator.modulus(10, 3), 1)
    }
}
