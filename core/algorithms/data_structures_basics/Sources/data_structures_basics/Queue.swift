// queue — cola FIFO construida desde cero sobre Node.
//
// Especificación: 06_Data_Structures_Basics
//
// Contrato: ADT independiente; mantiene su propio frente, su final y su contador
// y no delega en `LinkedList`. `isEmpty`, `size` y `peek` observan sin mutar;
// `enqueue` y `dequeue` mutan en sitio. Todas las operaciones son O(1).
//
// Forma: `public struct` con métodos `mutating` (ver las notas de `Node.swift`).
// El inicializador por defecto deja la cola vacía —el `init()` de la
// especificación— y queda implementado; es el único cuerpo que no es un
// esqueleto.
//
// Adecuaciones de salida de centinela (ver `Node.swift`):
//   - `dequeue` y `peek` devuelven -1 cuando la cola está vacía.
//   - `isEmpty` devuelve `false` mientras su cuerpo sea un esqueleto.
//   - `size` devuelve -1 mientras su cuerpo sea un esqueleto.
public struct Queue {
    private var frontNode: Node?
    private var rearNode: Node?
    private var count: Int

    /// Crea una cola vacía: sin frente, sin final y con el contador a cero.
    public init() {
        self.frontNode = nil
        self.rearNode = nil
        self.count = 0
    }

    /// `true` solo si no hay nodos.
    public var isEmpty: Bool {
        count == 0
    }

    /// Número de nodos almacenados. El centinela es -1 mientras sea un esqueleto.
    public var size: Int {
        count
    }

    /// Valor del frente, o -1 cuando la cola está vacía. No muta.
    public var peek: Int {
        frontNode?.value ?? -1
    }

    /// Encola `value` por el final. O(1).
    public mutating func enqueue(_ value: Int) {
        let node = Node(value)
        if let rear = rearNode {
            rear.next = node
        } else {
            frontNode = node
        }
        rearNode = node
        count += 1
    }

    /// Desencola y devuelve el valor del frente, o -1 cuando está vacía. O(1).
    @discardableResult
    public mutating func dequeue() -> Int {
        guard let node = frontNode else {
            return -1
        }
        frontNode = node.next
        if frontNode == nil {
            rearNode = nil
        }
        count -= 1
        return node.value
    }
}
