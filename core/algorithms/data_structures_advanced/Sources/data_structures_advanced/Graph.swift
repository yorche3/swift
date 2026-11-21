public struct Graph {
    private var _vertices: GraphNode?
    private var _vertexCount: Int
    private var _edgeCount: Int

    public init() {
        self._vertices = nil
        self._vertexCount = 0
        self._edgeCount = 0
    }

    private func findVertex(_ label: Int) -> GraphNode? {
        var current = _vertices
        while let node = current {
            if node.value == label {
                return node
            }
            current = node.nextVertex
        }
        return nil
    }

    @discardableResult
    public mutating func addVertex(_ label: Int) -> Bool {
        if findVertex(label) != nil {
            return true
        }
        let newVertex = GraphNode(label)
        newVertex.nextVertex = _vertices
        _vertices = newVertex
        _vertexCount += 1
        return true
    }

    @discardableResult
    public mutating func addEdge(_ u: Int, _ v: Int) -> Bool {
        guard let uVertex = findVertex(u), findVertex(v) != nil else {
            return false
        }
        if uVertex.addNeighborIfAbsent(v) {
            _edgeCount += 1
        }
        return true
    }

    public func hasEdge(_ u: Int, _ v: Int) -> Bool {
        guard let uVertex = findVertex(u) else {
            return false
        }
        return uVertex.hasNeighbor(v)
    }

    public func getNeighbors(_ u: Int) -> [Int]? {
        guard let uVertex = findVertex(u) else {
            return nil
        }
        return uVertex.neighbors
    }

    public var isEmpty: Bool {
        _vertexCount == 0
    }

    public var vertexCount: Int {
        _vertexCount
    }

    public var edgeCount: Int {
        _edgeCount
    }
}
