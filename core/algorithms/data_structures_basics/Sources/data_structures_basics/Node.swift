// node — celda enlazada compartida por LinkedList, Stack y Queue.
//
// Especificación: 06_Data_Structures_Basics
//
// Contrato: un único tipo de celda para las tres estructuras. El valor es
// inmutable tras la construcción (`let value`) y el enlace es mutable
// (`var next`), que es lo que permite reenganchar y avanzar sin copiar la celda.
//
// Forma (combinación class + struct): `public final class Node` es una referencia
// —así el enlace de la cola se escribe en O(1)— y las tres estructuras son
// `struct` con métodos `mutating`, de modo que cada una tiene semántica de valor
// en sus propios campos (cabeza, cola y contador) y comparte las celdas.
//
// Adecuaciones de salida de centinela (todavía no hay fallos reales):
//   - **Int → -1**: las lecturas enteras que pueden fallar —`head`, `peek`,
//     `pop`, `dequeue`— y `size` mientras su cuerpo sea un esqueleto.
//   - **Bool → false**: `isEmpty` y `delete`.
//   - **Solo los enlaces usan nulo**: `next` es `Node?` y `nil` es la ausencia de
//     enlace. Ningún cuerpo lanza excepciones ni llama a `fatalError`.
//
// Sondeo previo de viabilidad (12-10-2026; el archivo de sondeo ya se borró): la
// combinación compila, el contrato se sostiene y las inserciones siguen en O(1),
// con dos consecuencias que hay que respetar al escribir la suite:
//   - una llamada `mutating` no puede ir dentro de `#expect`: el macro copia el
//     receptor y `$0` queda inmutable. Se llama antes, en una variable, y el macro
//     comprueba el resultado.
//   - las celdas son referencias: dos copias de una estructura comparten los nodos
//     que ya estaban enlazados. El contrato usa una instancia por estructura.
public final class Node {
    /// Valor almacenado; no cambia tras construirse.
    public let value: Int

    /// Enlace a la celda siguiente, o `nil` cuando no hay ninguna.
    public var next: Node?

    /// Crea una celda con `value` y el enlace ausente (el `init` de la
    /// especificación). Queda implementado: es el estado inicial del contrato, y
    /// un `let` no puede quedar sin asignar sin lanzar una excepción.
    public init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}
