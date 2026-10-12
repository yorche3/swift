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
        -1
    }

    /// `true` solo si no hay nodos.
    public var isEmpty: Bool {
        false
    }

    /// Número de nodos almacenados. El centinela es -1 mientras sea un esqueleto.
    public var size: Int {
        -1
    }

    /// Inserta `value` al principio. O(1).
    public mutating func insertHead(_ value: Int) {}

    /// Inserta `value` al final. O(1).
    public mutating func insertTail(_ value: Int) {}

    /// Borra la primera aparición de `value`. O(n).
    /// Devuelve `true` cuando borró un nodo y `false` cuando el valor no estaba.
    @discardableResult
    public mutating func delete(_ value: Int) -> Bool {
        false
    }
}
