public struct Graph {
    public init() {}

    @discardableResult
    public mutating func addVertex(_ label: Int) -> Bool {
        false
    }

    @discardableResult
    public mutating func addEdge(_ u: Int, _ v: Int) -> Bool {
        false
    }

    public func hasEdge(_ u: Int, _ v: Int) -> Bool {
        false
    }

    public func getNeighbors(_ u: Int) -> [Int]? {
        nil
    }

    public var isEmpty: Bool {
        false
    }

    public var vertexCount: Int {
        0
    }

    public var edgeCount: Int {
        0
    }
}
