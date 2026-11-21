public struct BinaryTree {
    private var _root: TreeNode?
    private var _count: Int

    public init() {
        self._root = nil
        self._count = 0
    }

    private static func insertNode(_ node: TreeNode?, _ value: Int) -> Bool {
        guard let node else {
            return false
        }
        if value == node.value {
            return false
        }
        if value < node.value {
            if let left = node.left {
                return insertNode(left, value)
            }
            node.left = TreeNode(value)
            return true
        }
        if let right = node.right {
            return insertNode(right, value)
        }
        node.right = TreeNode(value)
        return true
    }

    @discardableResult
    public mutating func insert(_ value: Int) -> Bool {
        if _root == nil {
            _root = TreeNode(value)
            _count += 1
            return true
        }
        if Self.insertNode(_root, value) {
            _count += 1
        }
        return true
    }

    public func contains(_ value: Int) -> Bool {
        var current = _root
        while let node = current {
            if value == node.value {
                return true
            } else if value < node.value {
                current = node.left
            } else {
                current = node.right
            }
        }
        return false
    }

    public var isEmpty: Bool {
        _count == 0
    }

    public var size: Int {
        _count
    }
}
