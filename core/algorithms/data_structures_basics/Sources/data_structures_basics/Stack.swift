// stack — pila LIFO construida desde cero sobre Node.
//
// Especificación: 06_Data_Structures_Basics
//
// Contrato: ADT independiente; mantiene su propia cima y su contador y no delega
// en `LinkedList`. `isEmpty`, `size` y `peek` observan sin mutar; `push` y `pop`
// mutan en sitio. Todas las operaciones son O(1).
//
// Forma: `public struct` con métodos `mutating` (ver las notas de `Node.swift`).
// El inicializador por defecto deja la pila vacía —el `init()` de la
// especificación— y queda implementado; es el único cuerpo que no es un
// esqueleto.
//
// Adecuaciones de salida de centinela (ver `Node.swift`):
//   - `pop` y `peek` devuelven -1 cuando la pila está vacía.
//   - `isEmpty` devuelve `false` mientras su cuerpo sea un esqueleto.
//   - `size` devuelve -1 mientras su cuerpo sea un esqueleto.
public struct Stack {
    private var topNode: Node?
    private var count: Int

    /// Crea una pila vacía: sin cima y con el contador a cero.
    public init() {
        self.topNode = nil
        self.count = 0
    }

    /// `true` solo si no hay nodos.
    public var isEmpty: Bool {
        false
    }

    /// Número de nodos almacenados. El centinela es -1 mientras sea un esqueleto.
    public var size: Int {
        -1
    }

    /// Valor de la cima, o -1 cuando la pila está vacía. No muta.
    public var peek: Int {
        -1
    }

    /// Apila `value` sobre la cima. O(1).
    public mutating func push(_ value: Int) {}

    /// Desapila y devuelve el valor de la cima, o -1 cuando está vacía. O(1).
    @discardableResult
    public mutating func pop() -> Int {
        -1
    }
}
