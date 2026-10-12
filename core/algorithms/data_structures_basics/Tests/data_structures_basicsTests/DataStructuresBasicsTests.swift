import XCTest
@testable import data_structures_basics

private enum Fixtures {
    static let firstNodeValueInput = 10
    static let firstNodeValueOutput = 10
    static let secondNodeValueInput = 20
    static let secondNodeValueOutput = 20

    static let listTailFirstInput = 10
    static let listTailSecondInput = 20
    static let listHeadInput = 5
    static let listTailDuplicateInput = 10
    static let listInitialSizeOutput = 0
    static let listInsertedSizeOutput = 4
    static let listFirstDeleteInput = 10
    static let listFirstDeleteSizeOutput = 3
    static let listAbsentDeleteInput = 99
    static let listHeadAfterInsertOutput = 5
    static let listHeadAfterFirstDeleteOutput = 5
    static let listHeadAfterDeletingFirstOutput = 20
    static let listHeadAfterDeletingSecondOutput = 10

    static let stackFirstInput = 10
    static let stackSecondInput = 20
    static let stackThirdInput = 30
    static let stackReuseInput = 40
    static let stackInitialSizeOutput = 0
    static let stackFilledSizeOutput = 3
    static let stackPeekOutput = 30
    static let stackFirstPopOutput = 30
    static let stackSecondPopOutput = 40
    static let stackThirdPopOutput = 20
    static let stackFourthPopOutput = 10

    static let queueFirstInput = 10
    static let queueSecondInput = 20
    static let queueThirdInput = 30
    static let queueReuseInput = 40
    static let queueInitialSizeOutput = 0
    static let queueFilledSizeOutput = 3
    static let queuePeekOutput = 10
    static let queueFirstDequeueOutput = 10
    static let queueSecondDequeueOutput = 20
    static let queueThirdDequeueOutput = 30
    static let queueFourthDequeueOutput = 40

    static let failureIndicator = -1
}

private struct NamedCase {
    let name: String
    let verify: (String) -> Void
}

private func runCases(_ subject: String, _ cases: [NamedCase]) {
    for testCase in cases {
        testCase.verify("\(subject) \(testCase.name)")
    }
}

final class DataStructuresBasicsTests: XCTestCase {
    func testNode() {
        let firstNode = Node(Fixtures.firstNodeValueInput)

        runCases("Node", [
            NamedCase(name: "initialize and observe value/link") { name in
                XCTAssertEqual(firstNode.value, Fixtures.firstNodeValueOutput, "\(name) should retain its value")
                XCTAssertNil(firstNode.next, "\(name) should have no next node")
            },
            NamedCase(name: "initialize another node, link and traverse") { name in
                let secondNode = Node(Fixtures.secondNodeValueInput)
                firstNode.next = secondNode

                XCTAssertEqual(firstNode.next?.value, Fixtures.secondNodeValueOutput, "\(name) should expose the linked value")
                XCTAssertNil(secondNode.next, "\(name) should leave the second node unlinked")
            },
        ])
    }

    func testLinkedList() {
        var list = LinkedList()

        runCases("LinkedList", [
            NamedCase(name: "empty state") { name in
                XCTAssertTrue(list.isEmpty, "\(name) should report empty")
                XCTAssertEqual(list.size, Fixtures.listInitialSizeOutput, "\(name) should have size zero")
                XCTAssertEqual(list.head, Fixtures.failureIndicator, "\(name) should return the failure indicator for its head")
            },
            NamedCase(name: "insert at both ends") { name in
                list.insertTail(Fixtures.listTailFirstInput)
                list.insertTail(Fixtures.listTailSecondInput)
                list.insertHead(Fixtures.listHeadInput)
                list.insertTail(Fixtures.listTailDuplicateInput)

                XCTAssertEqual(list.size, Fixtures.listInsertedSizeOutput, "\(name) should contain four values")
                XCTAssertEqual(list.head, Fixtures.listHeadAfterInsertOutput, "\(name) should expose the head value")
            },
            NamedCase(name: "delete first occurrence") { name in
                XCTAssertTrue(list.delete(Fixtures.listFirstDeleteInput), "\(name) should delete the first matching value")
                XCTAssertEqual(list.size, Fixtures.listFirstDeleteSizeOutput, "\(name) should reduce its size")
                XCTAssertEqual(list.head, Fixtures.listHeadAfterFirstDeleteOutput, "\(name) should preserve the head value")
            },
            NamedCase(name: "absent value") { name in
                XCTAssertFalse(list.delete(Fixtures.listAbsentDeleteInput), "\(name) should return failure for an absent value")
                XCTAssertEqual(list.size, Fixtures.listFirstDeleteSizeOutput, "\(name) should preserve its size")
                XCTAssertEqual(list.head, Fixtures.listHeadAfterFirstDeleteOutput, "\(name) should preserve its order")
            },
            NamedCase(name: "empty the list") { name in
                XCTAssertTrue(list.delete(Fixtures.listHeadInput), "\(name) should delete the head")
                XCTAssertEqual(list.head, Fixtures.listHeadAfterDeletingFirstOutput, "\(name) should expose the next value")
                XCTAssertTrue(list.delete(Fixtures.listTailSecondInput), "\(name) should delete the next value")
                XCTAssertEqual(list.head, Fixtures.listHeadAfterDeletingSecondOutput, "\(name) should expose the remaining value")
                XCTAssertTrue(list.delete(Fixtures.listTailDuplicateInput), "\(name) should delete the final value")
                XCTAssertTrue(list.isEmpty, "\(name) should report empty")
                XCTAssertEqual(list.size, Fixtures.listInitialSizeOutput, "\(name) should have size zero")
                XCTAssertEqual(list.head, Fixtures.failureIndicator, "\(name) should return the failure indicator for its head")
            },
        ])
    }

    func testStack() {
        var stack = Stack()

        runCases("Stack", [
            NamedCase(name: "empty state and failed removal") { name in
                XCTAssertTrue(stack.isEmpty, "\(name) should report empty")
                XCTAssertEqual(stack.size, Fixtures.stackInitialSizeOutput, "\(name) should have size zero")
                XCTAssertEqual(stack.peek, Fixtures.failureIndicator, "\(name) should return the failure indicator when peeking")
                XCTAssertEqual(stack.pop(), Fixtures.failureIndicator, "\(name) should return the failure indicator when popping")
            },
            NamedCase(name: "LIFO and non-mutating peek") { name in
                stack.push(Fixtures.stackFirstInput)
                stack.push(Fixtures.stackSecondInput)
                stack.push(Fixtures.stackThirdInput)

                XCTAssertEqual(stack.peek, Fixtures.stackPeekOutput, "\(name) should expose the last pushed value")
                XCTAssertEqual(stack.size, Fixtures.stackFilledSizeOutput, "\(name) should preserve its size after peeking")
            },
            NamedCase(name: "removal and reuse") { name in
                XCTAssertEqual(stack.pop(), Fixtures.stackFirstPopOutput, "\(name) should remove the current top")
                stack.push(Fixtures.stackReuseInput)
                XCTAssertEqual(stack.pop(), Fixtures.stackSecondPopOutput, "\(name) should remove the reused top")
                XCTAssertEqual(stack.pop(), Fixtures.stackThirdPopOutput, "\(name) should preserve LIFO order")
                XCTAssertEqual(stack.pop(), Fixtures.stackFourthPopOutput, "\(name) should remove the oldest value last")
                XCTAssertTrue(stack.isEmpty, "\(name) should report empty")
                XCTAssertEqual(stack.size, Fixtures.stackInitialSizeOutput, "\(name) should have size zero")
            },
            NamedCase(name: "empty after removal") { name in
                XCTAssertEqual(stack.pop(), Fixtures.failureIndicator, "\(name) should return the failure indicator")
                XCTAssertTrue(stack.isEmpty, "\(name) should remain empty")
            },
        ])
    }

    func testQueue() {
        var queue = Queue()

        runCases("Queue", [
            NamedCase(name: "empty state and failed removal") { name in
                XCTAssertTrue(queue.isEmpty, "\(name) should report empty")
                XCTAssertEqual(queue.size, Fixtures.queueInitialSizeOutput, "\(name) should have size zero")
                XCTAssertEqual(queue.peek, Fixtures.failureIndicator, "\(name) should return the failure indicator when peeking")
                XCTAssertEqual(queue.dequeue(), Fixtures.failureIndicator, "\(name) should return the failure indicator when dequeuing")
            },
            NamedCase(name: "FIFO and non-mutating peek") { name in
                queue.enqueue(Fixtures.queueFirstInput)
                queue.enqueue(Fixtures.queueSecondInput)
                queue.enqueue(Fixtures.queueThirdInput)

                XCTAssertEqual(queue.peek, Fixtures.queuePeekOutput, "\(name) should expose the first enqueued value")
                XCTAssertEqual(queue.size, Fixtures.queueFilledSizeOutput, "\(name) should preserve its size after peeking")
            },
            NamedCase(name: "removal and reuse") { name in
                XCTAssertEqual(queue.dequeue(), Fixtures.queueFirstDequeueOutput, "\(name) should remove the first value")
                queue.enqueue(Fixtures.queueReuseInput)
                XCTAssertEqual(queue.dequeue(), Fixtures.queueSecondDequeueOutput, "\(name) should preserve FIFO order")
                XCTAssertEqual(queue.dequeue(), Fixtures.queueThirdDequeueOutput, "\(name) should preserve FIFO order")
                XCTAssertEqual(queue.dequeue(), Fixtures.queueFourthDequeueOutput, "\(name) should remove the reused value last")
                XCTAssertTrue(queue.isEmpty, "\(name) should report empty")
                XCTAssertEqual(queue.size, Fixtures.queueInitialSizeOutput, "\(name) should have size zero")
            },
            NamedCase(name: "empty after removal") { name in
                XCTAssertEqual(queue.dequeue(), Fixtures.failureIndicator, "\(name) should return the failure indicator")
                XCTAssertTrue(queue.isEmpty, "\(name) should remain empty")
            },
        ])
    }
}
