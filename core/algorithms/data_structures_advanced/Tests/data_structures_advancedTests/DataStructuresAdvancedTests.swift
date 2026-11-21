import XCTest
@testable import data_structures_advanced

private enum Fixtures {
    static let parentValueInput = 10
    static let parentValueOutput = 10
    static let leftChildInput = 20
    static let leftChildOutput = 20
    static let rightChildInput = 30
    static let rightChildOutput = 30

    static let rootInput = 50
    static let lowerInput = 30
    static let higherInput = 70
    static let deepLowerInput = 20
    static let deepMiddleInput = 40
    static let absentValueInput = 99
    static let emptyTreeSizeOutput = 0
    static let rootTreeSizeOutput = 1
    static let threeValuesSizeOutput = 3
    static let fiveValuesSizeOutput = 5

    static let vertexTen = 10
    static let vertexThirty = 30
    static let vertexFifty = 50
    static let vertexSeventy = 70
    static let missingVertexNinetyEight = 98
    static let missingVertexNinetyNine = 99
    static let emptyNeighborsOutput: [Int] = []
    static let tenToThirtyNeighborsOutput = [30]
    static let tenSortedNeighborsOutput = [30, 50, 70]
    static let thirtyNeighborsOutput = [50]
    static let selfLoopNeighborsOutput = [10]
}

private func insertAll(_ tree: inout BinaryTree, _ values: [Int]) -> [Bool] {
    values.map { tree.insert($0) }
}

final class TreeNodeTests: XCTestCase {
    func testCreateTreeNode() {
        let node = TreeNode(Fixtures.parentValueInput)

        XCTAssertEqual(node.value, Fixtures.parentValueOutput, "TreeNode create should retain its value")
    }

    func testAbsentInitialLinks() {
        let node = TreeNode(Fixtures.parentValueInput)

        XCTAssertNil(node.left, "TreeNode absent initial links should have no left child")
        XCTAssertNil(node.right, "TreeNode absent initial links should have no right child")
    }

    func testLinkTwoChildren() {
        let parent = TreeNode(Fixtures.parentValueInput)
        parent.left = TreeNode(Fixtures.leftChildInput)
        parent.right = TreeNode(Fixtures.rightChildInput)

        XCTAssertEqual(parent.left?.value, Fixtures.leftChildOutput, "TreeNode link two children should expose the left child")
        XCTAssertEqual(parent.right?.value, Fixtures.rightChildOutput, "TreeNode link two children should expose the right child")
    }

    func testTraverseEachLink() {
        let parent = TreeNode(Fixtures.parentValueInput)
        parent.left = TreeNode(Fixtures.leftChildInput)
        parent.right = TreeNode(Fixtures.rightChildInput)

        XCTAssertEqual(parent.left?.value, Fixtures.leftChildOutput, "TreeNode traverse each link should reach the left value")
        XCTAssertEqual(parent.right?.value, Fixtures.rightChildOutput, "TreeNode traverse each link should reach the right value")
        XCTAssertNil(parent.left?.left, "TreeNode traverse each link should leave left child's left link absent")
        XCTAssertNil(parent.left?.right, "TreeNode traverse each link should leave left child's right link absent")
        XCTAssertNil(parent.right?.left, "TreeNode traverse each link should leave right child's left link absent")
        XCTAssertNil(parent.right?.right, "TreeNode traverse each link should leave right child's right link absent")
    }

    func testUnlinkChildren() {
        let parent = TreeNode(Fixtures.parentValueInput)
        parent.left = TreeNode(Fixtures.leftChildInput)
        parent.right = TreeNode(Fixtures.rightChildInput)

        parent.left = nil
        XCTAssertNil(parent.left, "TreeNode unlink step 1 should clear the left link")
        XCTAssertEqual(parent.value, Fixtures.parentValueOutput, "TreeNode unlink step 1 should preserve the value")
        XCTAssertEqual(parent.right?.value, Fixtures.rightChildOutput, "TreeNode unlink step 1 should preserve the right child")

        parent.right = nil
        XCTAssertNil(parent.left, "TreeNode unlink step 2 should keep the left link absent")
        XCTAssertNil(parent.right, "TreeNode unlink step 2 should clear the right link")
        XCTAssertEqual(parent.value, Fixtures.parentValueOutput, "TreeNode unlink step 2 should preserve the value")
    }
}

final class BinaryTreeTests: XCTestCase {
    func testCreateEmpty() {
        let tree = BinaryTree()

        XCTAssertTrue(tree.isEmpty, "BinaryTree create empty should be empty")
        XCTAssertEqual(tree.size, Fixtures.emptyTreeSizeOutput, "BinaryTree create empty should have size 0")
        XCTAssertFalse(tree.contains(Fixtures.rootInput), "BinaryTree create empty should not contain 50")
    }

    func testInsertRoot() {
        var tree = BinaryTree()

        XCTAssertTrue(tree.insert(Fixtures.rootInput), "BinaryTree insert root should succeed")
        XCTAssertEqual(tree.size, Fixtures.rootTreeSizeOutput, "BinaryTree insert root should have size 1")
        XCTAssertFalse(tree.isEmpty, "BinaryTree insert root should not be empty")
        XCTAssertTrue(tree.contains(Fixtures.rootInput), "BinaryTree insert root should contain 50")
    }

    func testInsertLowerAndHigher() {
        var tree = BinaryTree()
        let results = insertAll(&tree, [Fixtures.rootInput, Fixtures.lowerInput, Fixtures.higherInput])

        XCTAssertEqual(results, [true, true, true], "BinaryTree insert lower and higher should succeed on each insert")
        XCTAssertEqual(tree.size, Fixtures.threeValuesSizeOutput, "BinaryTree insert lower and higher should have size 3")
        for value in [Fixtures.rootInput, Fixtures.lowerInput, Fixtures.higherInput] {
            XCTAssertTrue(tree.contains(value), "BinaryTree insert lower and higher should contain \(value)")
        }
    }

    func testMultilevelBranches() {
        var tree = BinaryTree()
        let values = [Fixtures.rootInput, Fixtures.lowerInput, Fixtures.higherInput, Fixtures.deepLowerInput, Fixtures.deepMiddleInput]
        let results = insertAll(&tree, values)

        XCTAssertEqual(results, [true, true, true, true, true], "BinaryTree multilevel branches should succeed on five inserts")
        for value in values {
            XCTAssertTrue(tree.contains(value), "BinaryTree multilevel branches should contain \(value)")
        }
        XCTAssertEqual(tree.size, Fixtures.fiveValuesSizeOutput, "BinaryTree multilevel branches should have size 5")
    }

    func testMissingValueInNonemptyTree() {
        var tree = BinaryTree()
        tree.insert(Fixtures.rootInput)

        XCTAssertFalse(tree.contains(Fixtures.absentValueInput), "BinaryTree missing value should not contain 99")
        XCTAssertEqual(tree.size, Fixtures.rootTreeSizeOutput, "BinaryTree missing value should keep size 1")
        XCTAssertTrue(tree.contains(Fixtures.rootInput), "BinaryTree missing value should still contain 50")
    }

    func testIdempotentDuplicate() {
        var tree = BinaryTree()
        let results = insertAll(&tree, [Fixtures.rootInput, Fixtures.lowerInput, Fixtures.higherInput, Fixtures.lowerInput])

        XCTAssertEqual(results, [true, true, true, true], "BinaryTree idempotent duplicate should succeed on four inserts")
        XCTAssertEqual(tree.size, Fixtures.threeValuesSizeOutput, "BinaryTree idempotent duplicate should have size 3")
        for value in [Fixtures.rootInput, Fixtures.lowerInput, Fixtures.higherInput] {
            XCTAssertTrue(tree.contains(value), "BinaryTree idempotent duplicate should preserve \(value)")
        }
    }

    func testOrderedInsertions() {
        var tree = BinaryTree()
        let values = [Fixtures.deepLowerInput, Fixtures.lowerInput, Fixtures.deepMiddleInput, Fixtures.rootInput, Fixtures.higherInput]
        let results = insertAll(&tree, values)

        XCTAssertEqual(results, [true, true, true, true, true], "BinaryTree ordered insertions should succeed on five inserts")
        XCTAssertEqual(tree.size, Fixtures.fiveValuesSizeOutput, "BinaryTree ordered insertions should have size 5")
        for value in values {
            XCTAssertTrue(tree.contains(value), "BinaryTree ordered insertions should contain \(value)")
        }
        XCTAssertFalse(tree.contains(Fixtures.absentValueInput), "BinaryTree ordered insertions should not contain 99")
    }
}

final class GraphTests: XCTestCase {
    private func makeGraph(_ labels: [Int]) -> Graph {
        var graph = Graph()
        for label in labels {
            graph.addVertex(label)
        }
        return graph
    }

    func testCreateEmpty() {
        let graph = Graph()

        XCTAssertTrue(graph.isEmpty, "Graph create empty should be empty")
        XCTAssertEqual(graph.vertexCount, 0, "Graph create empty should have 0 vertices")
        XCTAssertEqual(graph.edgeCount, 0, "Graph create empty should have 0 edges")
        XCTAssertFalse(graph.hasEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph create empty should have no edge 10->30")
        XCTAssertNil(graph.getNeighbors(Fixtures.vertexTen), "Graph create empty should fail neighbours of 10")
    }

    func testIsolatedVertex() {
        var graph = Graph()

        XCTAssertTrue(graph.addVertex(Fixtures.vertexTen), "Graph isolated vertex should add 10")
        XCTAssertFalse(graph.isEmpty, "Graph isolated vertex should not be empty")
        XCTAssertEqual(graph.vertexCount, 1, "Graph isolated vertex should have 1 vertex")
        XCTAssertEqual(graph.edgeCount, 0, "Graph isolated vertex should have 0 edges")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.emptyNeighborsOutput, "Graph isolated vertex should have empty neighbours of 10")
    }

    func testNonconsecutiveLabelsAndDirectedEdge() {
        var graph = Graph()

        XCTAssertTrue(graph.addVertex(Fixtures.vertexTen), "Graph directed edge should register 10")
        XCTAssertTrue(graph.addVertex(Fixtures.vertexSeventy), "Graph directed edge should register 70")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexSeventy), "Graph directed edge should add 10->70")
        XCTAssertTrue(graph.hasEdge(Fixtures.vertexTen, Fixtures.vertexSeventy), "Graph directed edge should have forward edge")
        XCTAssertFalse(graph.hasEdge(Fixtures.vertexSeventy, Fixtures.vertexTen), "Graph directed edge should not have reverse edge")
        XCTAssertEqual(graph.vertexCount, 2, "Graph directed edge should have 2 vertices")
        XCTAssertEqual(graph.edgeCount, 1, "Graph directed edge should have 1 edge")
    }

    func testDuplicateVertexPreservesAdjacency() {
        var graph = Graph()

        XCTAssertTrue(graph.addVertex(Fixtures.vertexTen), "Graph duplicate vertex should register 10")
        XCTAssertTrue(graph.addVertex(Fixtures.vertexThirty), "Graph duplicate vertex should register 30")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph duplicate vertex should add 10->30")
        XCTAssertTrue(graph.addVertex(Fixtures.vertexTen), "Graph duplicate vertex should accept 10 again")
        XCTAssertEqual(graph.vertexCount, 2, "Graph duplicate vertex should have 2 vertices")
        XCTAssertEqual(graph.edgeCount, 1, "Graph duplicate vertex should have 1 edge")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.tenToThirtyNeighborsOutput, "Graph duplicate vertex should preserve neighbours of 10")
    }

    func testDuplicateEdge() {
        var graph = makeGraph([Fixtures.vertexTen, Fixtures.vertexThirty])

        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph duplicate edge should add 10->30 first time")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph duplicate edge should add 10->30 second time")
        XCTAssertEqual(graph.vertexCount, 2, "Graph duplicate edge should have 2 vertices")
        XCTAssertEqual(graph.edgeCount, 1, "Graph duplicate edge should have 1 edge")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.tenToThirtyNeighborsOutput, "Graph duplicate edge should list 30 once")
    }

    func testMissingEndpointWithoutMutation() {
        var graph = makeGraph([Fixtures.vertexTen, Fixtures.vertexThirty])
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph missing endpoint setup should add 10->30")

        XCTAssertFalse(graph.addEdge(Fixtures.vertexTen, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should fail 10->99")
        XCTAssertFalse(graph.addEdge(Fixtures.missingVertexNinetyNine, Fixtures.vertexTen), "Graph missing endpoint should fail 99->10")
        XCTAssertFalse(graph.addEdge(Fixtures.missingVertexNinetyEight, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should fail 98->99")
        XCTAssertFalse(graph.addEdge(Fixtures.missingVertexNinetyNine, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should fail 99->99")
        XCTAssertEqual(graph.vertexCount, 2, "Graph missing endpoint should keep 2 vertices")
        XCTAssertEqual(graph.edgeCount, 1, "Graph missing endpoint should keep 1 edge")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.tenToThirtyNeighborsOutput, "Graph missing endpoint should preserve neighbours of 10")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexThirty), Fixtures.emptyNeighborsOutput, "Graph missing endpoint should keep neighbours of 30 empty")
        XCTAssertFalse(graph.hasEdge(Fixtures.vertexTen, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should have no edge 10->99")
        XCTAssertFalse(graph.hasEdge(Fixtures.missingVertexNinetyNine, Fixtures.vertexTen), "Graph missing endpoint should have no edge 99->10")
        XCTAssertFalse(graph.hasEdge(Fixtures.missingVertexNinetyEight, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should have no edge 98->99")
        XCTAssertFalse(graph.hasEdge(Fixtures.missingVertexNinetyNine, Fixtures.missingVertexNinetyNine), "Graph missing endpoint should have no edge 99->99")
        XCTAssertNil(graph.getNeighbors(Fixtures.missingVertexNinetyEight), "Graph missing endpoint should fail neighbours of 98")
        XCTAssertNil(graph.getNeighbors(Fixtures.missingVertexNinetyNine), "Graph missing endpoint should fail neighbours of 99")
    }

    func testSortedNeighborsAndCounts() {
        var graph = makeGraph([Fixtures.vertexTen, Fixtures.vertexThirty, Fixtures.vertexFifty, Fixtures.vertexSeventy])

        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexSeventy), "Graph sorted neighbours should add 10->70")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph sorted neighbours should add 10->30")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexFifty), "Graph sorted neighbours should add 10->50")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexThirty, Fixtures.vertexFifty), "Graph sorted neighbours should add 30->50")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.tenSortedNeighborsOutput, "Graph sorted neighbours should list 10's neighbours ascending")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexThirty), Fixtures.thirtyNeighborsOutput, "Graph sorted neighbours should list 30's neighbours")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexFifty), Fixtures.emptyNeighborsOutput, "Graph sorted neighbours should have empty neighbours of 50")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexSeventy), Fixtures.emptyNeighborsOutput, "Graph sorted neighbours should have empty neighbours of 70")
        XCTAssertEqual(graph.vertexCount, 4, "Graph sorted neighbours should have 4 vertices")
        XCTAssertEqual(graph.edgeCount, 4, "Graph sorted neighbours should have 4 edges")
    }

    func testMissingEdgeQuery() {
        let graph = makeGraph([Fixtures.vertexTen, Fixtures.vertexThirty])

        XCTAssertFalse(graph.hasEdge(Fixtures.vertexTen, Fixtures.vertexThirty), "Graph missing-edge query should fail for 10->30")
        XCTAssertEqual(graph.vertexCount, 2, "Graph missing-edge query should have 2 vertices")
        XCTAssertEqual(graph.edgeCount, 0, "Graph missing-edge query should have 0 edges")
        XCTAssertFalse(graph.isEmpty, "Graph missing-edge query should not be empty")
    }

    func testNeighborsOfMissingVertex() {
        let graph = makeGraph([Fixtures.vertexTen])

        XCTAssertNil(graph.getNeighbors(Fixtures.missingVertexNinetyNine), "Graph missing vertex neighbours should fail for 99")
        XCTAssertNotNil(graph.getNeighbors(Fixtures.vertexTen), "Graph missing vertex neighbours should distinguish empty neighbours of 10 from failure")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.emptyNeighborsOutput, "Graph missing vertex neighbours should keep 10's neighbours empty")
        XCTAssertEqual(graph.vertexCount, 1, "Graph missing vertex neighbours should have 1 vertex")
        XCTAssertEqual(graph.edgeCount, 0, "Graph missing vertex neighbours should have 0 edges")
    }

    func testSelfLoopAndDuplicate() {
        var graph = makeGraph([Fixtures.vertexTen])

        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexTen), "Graph self-loop should add 10->10 first time")
        XCTAssertTrue(graph.addEdge(Fixtures.vertexTen, Fixtures.vertexTen), "Graph self-loop should add 10->10 second time")
        XCTAssertTrue(graph.hasEdge(Fixtures.vertexTen, Fixtures.vertexTen), "Graph self-loop should have loop 10->10")
        XCTAssertEqual(graph.getNeighbors(Fixtures.vertexTen), Fixtures.selfLoopNeighborsOutput, "Graph self-loop should list 10 once as neighbour")
        XCTAssertEqual(graph.vertexCount, 1, "Graph self-loop should have 1 vertex")
        XCTAssertEqual(graph.edgeCount, 1, "Graph self-loop should have 1 edge")
    }
}
