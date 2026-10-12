// linked_list — lista enlazada simple construida desde cero sobre Node.
//
// Especificación: 06_Data_Structures_Basics
//
// Contrato: `head`, `isEmpty` y `size` observan sin mutar; `insertHead`,
// `insertTail` y `delete` mutan en sitio. La lista guarda cabeza, cola y
// contador, así que las dos inserciones son O(1) y `delete` recorre en O(n),
// como pide la especificación.
//
// Forma: `public struct` con métodos `mutating` (ver las notas de `Node.swift`).
// El inicializador por defecto deja la lista vacía —el `init()` de la
// especificación— y queda implementado; es el único cuerpo que no es un
// esqueleto.
//
// Adecuaciones de salida de centinela (ver `Node.swift`):
//   - `head` devuelve -1 cuando la lista está vacía.
//   - `delete` devuelve `false` cuando el valor no estaba en la lista.
//   - `size` devuelve -1 mientras su cuerpo sea un esqueleto.
public struct LinkedList {
    private var headNode: Node?
    private var tailNode: Node?
    private var count: Int

    /// Crea una lista vacía: sin enlaces y con el contador a cero.
    public init() {
        self.headNode = nil
        self.tailNode = nil
        self.count = 0
    }

    /// Valor de la cabeza, o -1 cuando la lista está vacía. No muta.
    public var head: Int {
        headNode?.value ?? -1
    }

    /// `true` solo si no hay nodos.
    public var isEmpty: Bool {
        count == 0
    }

    /// Número de nodos almacenados. El centinela es -1 mientras sea un esqueleto.
    public var size: Int {
        count
    }

    /// Inserta `value` al principio. O(1).
    public mutating func insertHead(_ value: Int) {
        let node = Node(value)
        node.next = headNode
        headNode = node
        if tailNode == nil {
            tailNode = node
        }
        count += 1
    }

    /// Inserta `value` al final. O(1).
    public mutating func insertTail(_ value: Int) {
        let node = Node(value)
        if tailNode != nil {
            tailNode!.next = node
        }
        tailNode = node
        if headNode == nil {
            headNode = node
        }
        count += 1
    }

    /// Borra la primera aparición de `value`. O(n).
    /// Devuelve `true` cuando borró un nodo y `false` cuando el valor no estaba.
    @discardableResult
    public mutating func delete(_ value: Int) -> Bool {
        var current = headNode
        var previous: Node? = nil
        while current != nil {
            if current!.value == value {
                if previous == nil {
                    headNode = current!.next
                } else {
                    previous!.next = current!.next
                }
                if current!.next == nil {
                    tailNode = previous
                }
                count -= 1
                return true
            }
            previous = current
            current = current!.next
        }
        return false
    }
}
