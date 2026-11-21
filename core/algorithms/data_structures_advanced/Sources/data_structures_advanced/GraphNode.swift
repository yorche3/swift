final class GraphNode: Node {
    var neighbors: [Int] = []
    var nextVertex: GraphNode?

    override init(_ label: Int) {
        super.init(label)
    }

    /// Indica si `v` ya figura en la adyacencia, recorriéndola a mano.
    func hasNeighbor(_ v: Int) -> Bool {
        var index = 0
        while index < neighbors.count {
            if neighbors[index] == v {
                return true
            }
            index += 1
        }
        return false
    }

    /// Inserta `v` en su posición creciente y devuelve si era nueva.
    ///
    /// La búsqueda de la posición se recorre a mano: no se usan `contains`,
    /// `firstIndex(of:)`, `sorted` ni `sort`.
    @discardableResult
    func addNeighborIfAbsent(_ v: Int) -> Bool {
        var index = 0
        while index < neighbors.count && neighbors[index] < v {
            index += 1
        }
        if index < neighbors.count && neighbors[index] == v {
            return false
        }
        neighbors.insert(v, at: index)
        return true
    }
}
