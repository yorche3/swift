import XCTest
@testable import Numbers

final class RecursiveTests: XCTestCase {
    func testSumOfFirstNRec() {
        XCTAssertEqual(Numbers.sum_of_first_n_rec(0), 0)
        XCTAssertEqual(Numbers.sum_of_first_n_rec(3), 6)
    }

    func testFactorialRec() {
        XCTAssertEqual(Numbers.factorial_rec(0), 1)
        XCTAssertEqual(Numbers.factorial_rec(4), 24)
    }

    func testFibonacciRec() {
        XCTAssertEqual(Numbers.fibonacci_rec(0), 0)
        XCTAssertEqual(Numbers.fibonacci_rec(1), 1)
        XCTAssertEqual(Numbers.fibonacci_rec(6), 8)
    }

    func testGreatestCommonDivisorRec() {
        XCTAssertEqual(Numbers.greatest_common_divisor_rec(12, 8), 4)
        XCTAssertEqual(Numbers.greatest_common_divisor_rec(7, 5), 1)
    }

    func testLeastCommonMultipleRec() {
        XCTAssertEqual(Numbers.least_common_multiple_rec(4, 6), 12)
        XCTAssertEqual(Numbers.least_common_multiple_rec(6, 8), 24)
    }
}
