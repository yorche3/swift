public final class TreeNode: Node {
    public var left: TreeNode?
    public var right: TreeNode?

    public override init(_ value: Int) {
        super.init(value)
        self.left = nil
        self.right = nil
    }
}
