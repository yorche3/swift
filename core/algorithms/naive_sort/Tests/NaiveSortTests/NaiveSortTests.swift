import XCTest

@testable import NaiveSort

/// Pruebas unitarias de la especificación 05_Naive_Sort.
///
/// Caso nulo omitido: `[Int]` es un tipo de valor y no admite `nil`, así que una
/// entrada nula no es representable en la firma y no hay indicador que
/// comprobar. Se conservan los 7 casos de la especificación.
///
/// Aislamiento: los arrays de Swift son tipos de valor, así que cada llamada
/// recibe su propia copia y los fixtures compartidos no se modifican.
final class NaiveSortTests: XCTestCase {
    private static let standardInput = [5, 2, 9, 1, 5, 6]
    private static let standardOutput = [1, 2, 5, 5, 6, 9]

    private static let sortedInput = [1, 2, 3, 4, 5]
    private static let sortedOutput = [1, 2, 3, 4, 5]

    private static let reverseInput = [5, 4, 3, 2, 1]
    private static let reverseOutput = [1, 2, 3, 4, 5]

    private static let identicalInput = [7, 7, 7, 7]
    private static let identicalOutput = [7, 7, 7, 7]

    private static let negativeInput = [3, -1, 4, -5, 0]
    private static let negativeOutput = [-5, -1, 0, 3, 4]

    private static let singleInput = [42]
    private static let singleOutput = [42]

    private static let emptyInput: [Int] = []
    private static let emptyOutput: [Int] = []

    /// Tabla de casos: descripción, entrada y salida esperada.
    private struct SortCase {
        let description: String
        let input: [Int]
        let expected: [Int]
    }

    private static let cases: [SortCase] = [
        SortCase(description: "an unsorted array", input: standardInput, expected: standardOutput),
        SortCase(description: "an already sorted array", input: sortedInput, expected: sortedOutput),
        SortCase(description: "a reverse ordered array", input: reverseInput, expected: reverseOutput),
        SortCase(description: "an array of identical elements", input: identicalInput, expected: identicalOutput),
        SortCase(description: "an array with negative numbers", input: negativeInput, expected: negativeOutput),
        SortCase(description: "a single element array", input: singleInput, expected: singleOutput),
        SortCase(description: "an empty array", input: emptyInput, expected: emptyOutput)
    ]

    /// Helper compartido: recibe el nombre del algoritmo y la función a probar, y
    /// ejecuta todos los casos con el mensaje descriptivo del contrato.
    private func assertSortsAllCases(algorithm: String, sort: ([Int]) -> [Int]) {
        for testCase in Self.cases {
            XCTAssertEqual(
                sort(testCase.input),
                testCase.expected,
                "\(algorithm) should sort \(testCase.description)"
            )
        }
    }

    func testSelectionSort() {
        assertSortsAllCases(algorithm: "selection_sort", sort: NaiveSort.selection_sort)
    }

    func testBubbleSort() {
        assertSortsAllCases(algorithm: "bubble_sort", sort: NaiveSort.bubble_sort)
    }

    func testInsertionSort() {
        assertSortsAllCases(algorithm: "insertion_sort", sort: NaiveSort.insertion_sort)
    }
}
