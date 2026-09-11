import XCTest
@testable import Numbers

final class IterativeTests: XCTestCase {
    func testSumOfFirstNIte() {
        XCTAssertEqual(Numbers.sum_of_first_n_ite(0), 0)
        XCTAssertEqual(Numbers.sum_of_first_n_ite(3), 6)
    }

    func testFactorialIte() {
        XCTAssertEqual(Numbers.factorial_ite(0), 1)
        XCTAssertEqual(Numbers.factorial_ite(4), 24)
    }

    func testFibonacciIte() {
        XCTAssertEqual(Numbers.fibonacci_ite(0), 0)
        XCTAssertEqual(Numbers.fibonacci_ite(1), 1)
        XCTAssertEqual(Numbers.fibonacci_ite(6), 8)
    }

    func testGreatestCommonDivisorIte() {
        XCTAssertEqual(Numbers.greatest_common_divisor_ite(12, 8), 4)
        XCTAssertEqual(Numbers.greatest_common_divisor_ite(7, 5), 1)
    }

    func testLeastCommonMultipleIte() {
        XCTAssertEqual(Numbers.least_common_multiple_ite(4, 6), 12)
        XCTAssertEqual(Numbers.least_common_multiple_ite(6, 8), 24)
    }
}
