# Data Structures Basics — Swift

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **Swift**, usando una estructura de librería de **Swift Package Manager** y **XCTest** para las pruebas unitarias.

Este módulo implementa desde cero `Node` como celda enlazada compartida y las estructuras `LinkedList`, `Stack` y `Queue`. Cada estructura gestiona manualmente sus propios punteros sin delegar en colecciones de la biblioteca estándar.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`Package.swift`](Package.swift) | Manifiesto del paquete SwiftPM, definición de producto de librería y targets / SwiftPM package manifest, library product and target definitions |
| [`Sources/data_structures_basics/Node.swift`](Sources/data_structures_basics/Node.swift) | Clase `Node` (`final class`), celda enlazada con `value` inmutable y enlace `next` / Linked cell `Node` (`final class`) with immutable `value` and mutable `next` link |
| [`Sources/data_structures_basics/LinkedList.swift`](Sources/data_structures_basics/LinkedList.swift) | Estructura `LinkedList` con punteros a cabeza y cola y contador / `LinkedList` struct with head, tail pointers and count |
| [`Sources/data_structures_basics/Stack.swift`](Sources/data_structures_basics/Stack.swift) | Estructura `Stack` LIFO sobre `Node` con puntero a cima / LIFO `Stack` struct over `Node` with top pointer |
| [`Sources/data_structures_basics/Queue.swift`](Sources/data_structures_basics/Queue.swift) | Estructura `Queue` FIFO sobre `Node` con punteros a frente y final / FIFO `Queue` struct over `Node` with front and rear pointers |
| [`Tests/data_structures_basicsTests/DataStructuresBasicsTests.swift`](Tests/data_structures_basicsTests/DataStructuresBasicsTests.swift) | Suite de pruebas unitarias XCTest para las 4 estructuras / XCTest unit test suite covering all 4 structures |
| [`.gitignore`](.gitignore) | Archivos y directorios ignorados por Git (`.build/`, `.swiftpm/`) / Git ignored files and directories (`.build/`, `.swiftpm/`) |

**Estructura de directorios / Directory structure:**

```text
data_structures_basics/
├── Package.swift
├── Sources/
│   └── data_structures_basics/
│       ├── LinkedList.swift
│       ├── Node.swift
│       ├── Queue.swift
│       └── Stack.swift
├── Tests/
│   └── data_structures_basicsTests/
│       └── DataStructuresBasicsTests.swift
├── .gitignore
└── README.md
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se configuró como librería de Swift Package Manager. Se adopta una arquitectura híbrida donde `Node` es un tipo de referencia (`public final class`) para permitir enlaces mutables $O(1)$ sin duplicación de celdas, mientras que `LinkedList`, `Stack` y `Queue` son tipos de valor (`public struct`) con métodos `mutating`.

**EN:** The project is configured as a Swift Package Manager library. A hybrid architecture is adopted where `Node` is a reference type (`public final class`) to enable $O(1)$ mutable linking without cell duplication, while `LinkedList`, `Stack`, and `Queue` are value types (`public struct`) with `mutating` methods.

### Inicialización / Initialization

```bash
swift package init --type library --name data_structures_basics
```

---

## 📄 Configuración clave / Key Configuration

### `Package.swift`

```swift
// swift-tools-version: 6.3
import PackageDescription

let package = Package(
    name: "data_structures_basics",
    products: [
        .library(
            name: "data_structures_basics",
            targets: ["data_structures_basics"]
        ),
    ],
    targets: [
        .target(
            name: "data_structures_basics"
        ),
        .testTarget(
            name: "data_structures_basicsTests",
            dependencies: ["data_structures_basics"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
```

---

## 🚀 Compilación y ejecución / Build & Run

```bash
swift build -Xswiftc -warnings-as-errors
swift test
```

**Salida real / Actual output:**

```text
$ swift build -Xswiftc -warnings-as-errors
[0/1] Planning build
Building for debugging...
[0/1] Write swift-version--609B5802F6F1D829.txt
Build complete! (0.10s)
```

```text
$ swift test
[0/1] Planning build
Building for debugging...
[0/2] Write swift-version--609B5802F6F1D829.txt
Build complete! (0.11s)
Test Suite 'All tests' started at 2026-10-12 10:23:14.280
Test Suite 'debug.xctest' started at 2026-10-12 10:23:14.281
Test Suite 'DataStructuresBasicsTests' started at 2026-10-12 10:23:14.281
Test Case 'DataStructuresBasicsTests.testLinkedList' started at 2026-10-12 10:23:14.281
Test Case 'DataStructuresBasicsTests.testLinkedList' passed (0.001 seconds)
Test Case 'DataStructuresBasicsTests.testNode' started at 2026-10-12 10:23:14.282
Test Case 'DataStructuresBasicsTests.testNode' passed (0.0 seconds)
Test Case 'DataStructuresBasicsTests.testQueue' started at 2026-10-12 10:23:14.282
Test Case 'DataStructuresBasicsTests.testQueue' passed (0.0 seconds)
Test Case 'DataStructuresBasicsTests.testStack' started at 2026-10-12 10:23:14.282
Test Case 'DataStructuresBasicsTests.testStack' passed (0.0 seconds)
Test Suite 'DataStructuresBasicsTests' passed at 2026-10-12 10:23:14.282
	 Executed 4 tests, with 0 failures (0 unexpected) in 0.001 (0.001) seconds
Test Suite 'debug.xctest' passed at 2026-10-12 10:23:14.282
	 Executed 4 tests, with 0 failures (0 unexpected) in 0.001 (0.001) seconds
Test Suite 'All tests' passed at 2026-10-12 10:23:14.282
	 Executed 4 tests, with 0 failures (0 unexpected) in 0.001 (0.001) seconds
◇ Test run started.
↳ Testing Library Version: 6.3.3 (48d727cc1cf4eda)
↳ Target Platform: x86_64-unknown-linux-gnu
✔ Test run with 0 tests in 0 suites passed after 0.001 seconds.
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.init(value)` | `Int → Node` | $O(1)$ | Celda con valor inmutable y enlace ausente (`nil`) / Cell with immutable value and absent link (`nil`) |
| `Node.value` | `() → Int` | $O(1)$ | Lectura de propiedad constante (`let value`) / Property read |
| `Node.next` | `() → Node?` | $O(1)$ | Lectura y reasignación de puntero de enlace / Pointer read and assignment |
| `LinkedList.init()` | `() → LinkedList` | $O(1)$ | Inicializa cabeza y cola en `nil`, y contador a 0 / Initializes head/tail to `nil` and count to 0 |
| `LinkedList.head` | `() → Int` | $O(1)$ | Propiedad computada; devuelve -1 si está vacía / Computed property; returns -1 if empty |
| `LinkedList.isEmpty` | `() → Bool` | $O(1)$ | Verifica `count == 0` / Checks `count == 0` |
| `LinkedList.size` | `() → Int` | $O(1)$ | Devuelve `count` / Returns `count` |
| `LinkedList.insertHead(value)` | `Int → ()` | $O(1)$ | Inserta nodo al inicio y actualiza cabeza / Inserts node at front and updates head |
| `LinkedList.insertTail(value)` | `Int → ()` | $O(1)$ | Inserta nodo al final usando puntero de cola / Inserts node at end using tail pointer |
| `LinkedList.delete(value)` | `Int → Bool` | $O(n)$ | Elimina la primera aparición recorriendo enlaces / Deletes first occurrence traversing links |
| `Stack.init()` | `() → Stack` | $O(1)$ | Inicializa cima en `nil` y contador a 0 / Initializes top to `nil` and count to 0 |
| `Stack.isEmpty` | `() → Bool` | $O(1)$ | Verifica `count == 0` / Checks `count == 0` |
| `Stack.size` | `() → Int` | $O(1)$ | Devuelve `count` / Returns `count` |
| `Stack.peek` | `() → Int` | $O(1)$ | Consulta valor de cima; devuelve -1 si está vacía / Queries top value; returns -1 if empty |
| `Stack.push(value)` | `Int → ()` | $O(1)$ | Inserta sobre cima y actualiza enlace / Pushes onto top and updates link |
| `Stack.pop()` | `() → Int` | $O(1)$ | Extrae cima y devuelve valor, o -1 si vacía / Pops top and returns value, or -1 if empty |
| `Queue.init()` | `() → Queue` | $O(1)$ | Inicializa frente y final en `nil` y contador a 0 / Initializes front and rear to `nil` and count to 0 |
| `Queue.isEmpty` | `() → Bool` | $O(1)$ | Verifica `count == 0` / Checks `count == 0` |
| `Queue.size` | `() → Int` | $O(1)$ | Devuelve `count` / Returns `count` |
| `Queue.peek` | `() → Int` | $O(1)$ | Consulta valor del frente; devuelve -1 si vacía / Queries front value; returns -1 if empty |
| `Queue.enqueue(value)` | `Int → ()` | $O(1)$ | Inserta tras el final y actualiza punteros / Enqueues behind rear and updates pointers |
| `Queue.dequeue()` | `() → Int` | $O(1)$ | Extrae frente y devuelve valor, o -1 si vacía / Dequeues front and returns value, or -1 if empty |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| `Node` como `final class` y ADTs como `struct` con métodos `mutating` | Todo como `class` o todo como estructuras recursivas indirectas | Permite mutación $O(1)$ del enlace de cola sin duplicar celdas ni requerir `indirect enum`, manteniendo semántica de valor limpia para los contenedores. |
| Métodos y propiedades idiomáticas en camelCase (`insertHead`, `isEmpty`, `head`, `peek`) | Funciones libres en snake_case como `insert_head` o `get_head` | Se alinea con las convenciones API de Swift manteniendo correspondencia exacta con el contrato de la especificación. |
| `@discardableResult` en `delete`, `pop` y `dequeue` | Exigir consumo obligatorio del valor de retorno | Facilita el uso cuando solo se desea el efecto colateral de extracción o eliminación sin comprobación inmediata del valor. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `src/` y `test/run_tests` | `Sources/data_structures_basics/` y `Tests/data_structures_basicsTests/` | Convención estándar de Swift Package Manager gestionada mediante `swift build` y `swift test`. |
| `get_head()`, `get_value()`, `get_next()`, `is_empty()`, `size()`, `peek()` | Propiedades Swift (`head`, `value`, `next`, `isEmpty`, `size`, `peek`) | En Swift, las consultas de estado sin efectos secundarios y de complejidad $O(1)$ se exponen idiomáticamente como propiedades. |
| `set_next(next)` | Propiedad mutable `node.next = next` | Swift modela mutaciones directas de referencias de clase mediante asignación de propiedades. |
| Nombres de métodos en snake_case (`insert_head`, `insert_tail`) | Nombres en camelCase (`insertHead`, `insertTail`) | Swift API Design Guidelines estipula camelCase para identificadores y métodos. |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `LinkedList.head` | Lista vacía / Empty list | `-1` | `LinkedList().head == -1` |
| `LinkedList.delete` | Valor no encontrado / Value not present | `false` | `list.delete(99) == false` |
| `Stack.peek` | Pila vacía / Empty stack | `-1` | `Stack().peek == -1` |
| `Stack.pop` | Pila vacía / Empty stack | `-1` | `stack.pop() == -1` |
| `Queue.peek` | Cola vacía / Empty queue | `-1` | `Queue().peek == -1` |
| `Queue.dequeue` | Cola vacía / Empty queue | `-1` | `queue.dequeue() == -1` |
| `Node.next` | Ausencia de enlace siguiente / No next node | `nil` | `Node(10).next == nil` |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| `Node`: Inicializar y observar valor/enlace | Sí | `DataStructuresBasicsTests.testNode` | Verifica `value == 10` y `next == nil` |
| `Node`: Inicializar otro nodo, enlazar y recorrer | Sí | `DataStructuresBasicsTests.testNode` | Verifica enlace entre dos nodos y fin de cadena |
| `LinkedList`: Estado vacío | Sí | `DataStructuresBasicsTests.testLinkedList` | Verifica `isEmpty == true`, `size == 0`, `head == -1` |
| `LinkedList`: Insertar por ambos extremos | Sí | `DataStructuresBasicsTests.testLinkedList` | Inserciones en cabeza y cola, orden observable y `size == 4` |
| `LinkedList`: Eliminar primera aparición | Sí | `DataStructuresBasicsTests.testLinkedList` | Borra primera aparición duplicada y verifica `size == 3` |
| `LinkedList`: Valor ausente | Sí | `DataStructuresBasicsTests.testLinkedList` | Borrado fallido de 99 devuelve `false` sin mutar |
| `LinkedList`: Vaciar | Sí | `DataStructuresBasicsTests.testLinkedList` | Borra elementos restantes hasta `isEmpty == true` y `size == 0` |
| `Stack`: Estado vacío y extracción fallida | Sí | `DataStructuresBasicsTests.testStack` | `isEmpty == true`, `size == 0`, `peek == -1`, `pop() == -1` |
| `Stack`: LIFO y `peek` no mutante | Sí | `DataStructuresBasicsTests.testStack` | Apilado sucesivo, `peek == 30` sin mutar tamaño |
| `Stack`: Extracción y reutilización | Sí | `DataStructuresBasicsTests.testStack` | Desapilado, reutilización y vaciado en orden LIFO |
| `Stack`: Vacío tras extracción | Sí | `DataStructuresBasicsTests.testStack` | `pop() == -1` en estado vacío |
| `Queue`: Estado vacío y extracción fallida | Sí | `DataStructuresBasicsTests.testQueue` | `isEmpty == true`, `size == 0`, `peek == -1`, `dequeue() == -1` |
| `Queue`: FIFO y `peek` no mutante | Sí | `DataStructuresBasicsTests.testQueue` | Encolado sucesivo, `peek == 10` sin mutar tamaño |
| `Queue`: Extracción y reutilización | Sí | `DataStructuresBasicsTests.testQueue` | Desencolado, reutilización y vaciado en orden FIFO |
| `Queue`: Vacío tras extracción | Sí | `DataStructuresBasicsTests.testQueue` | `dequeue() == -1` en estado vacío |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Dominio restringido a enteros no negativos (`Int >= 0`) | El valor `-1` no puede almacenarse como dato válido al colisionar con el indicador de centinela | En fases avanzadas se adoptarán tipos de retorno opcionales (`Int?`) o genéricos `T?`. |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Se comparte una única celda de enlace `Node` implementada como `final class` entre las tres estructuras (`LinkedList`, `Stack`, `Queue`), respetando la restricción de que `Stack` y `Queue` no deleguen operaciones en `LinkedList`.
- **EN:** A single linked cell `Node` implemented as `final class` is shared across all three structures (`LinkedList`, `Stack`, `Queue`), adhering to the restriction that `Stack` and `Queue` do not delegate operations to `LinkedList`.
- **ES:** Los tipos contenedores son `struct` con semántica de valor y métodos `mutating`. Cada instancia gestiona sus propios punteros (`headNode`, `tailNode`, `topNode`, `frontNode`, `rearNode`) y contadores independientes.
- **EN:** Container types are `struct`s with value semantics and `mutating` methods. Each instance independently manages its own pointers (`headNode`, `tailNode`, `topNode`, `frontNode`, `rearNode`) and counters.
- **ES:** El centinela de fallo para operaciones con resultado entero (`head`, `peek`, `pop`, `dequeue`) es `-1`. Para eliminación (`delete`), el fallo devuelve `false`. La ausencia de enlaces en nodos usa `nil`.
- **EN:** The failure sentinel for integer-returning operations (`head`, `peek`, `pop`, `dequeue`) is `-1`. For deletion (`delete`), failure returns `false`. Absent node links use `nil`.
- **ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.
- **EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) |
| Módulo homologado del lenguaje / Homologated module | [`swift/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [Swift Documentation](https://www.swift.org/documentation/) |

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
