# Numbers — Swift

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Swift**, usando una estructura de librería de **Swift Package Manager** y **XCTest** para las pruebas unitarias.

El módulo implementa los cinco algoritmos en tres enfoques: recursivo directo (`_rec`), recursivo con acumulador (`_acc`) e iterativo (`_ite`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`Package.swift`](Package.swift) | Manifiesto del paquete, producto de librería y target de pruebas. |
| [`Sources/Numbers/Numbers.swift`](Sources/Numbers/Numbers.swift) | Implementación de los 15 métodos. |
| [`Tests/NumbersTests/RecursiveTests.swift`](Tests/NumbersTests/RecursiveTests.swift) | Suite `_rec`: 5 tests agrupados por método y 11 assertions. |
| [`Tests/NumbersTests/IterativeTests.swift`](Tests/NumbersTests/IterativeTests.swift) | Suite `_ite`: 5 tests agrupados por método y 11 assertions. |
| [`.gitignore`](.gitignore) | Ignora `.build/` y `.swiftpm/`. |

```text
numbers/
├── Package.swift
├── Sources/
│   └── Numbers/
│       └── Numbers.swift
├── Tests/
│   └── NumbersTests/
│       ├── RecursiveTests.swift
│       └── IterativeTests.swift
├── .gitignore
└── README.md
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó como una librería Swift con Swift Package Manager. El código público está en `Sources/Numbers` y las pruebas en `Tests/NumbersTests`. XCTest forma parte del SDK de Swift, por lo que no se añade una dependencia externa.

**EN:** The project was created as a Swift library with Swift Package Manager. Public code is under `Sources/Numbers`, and tests are under `Tests/NumbersTests`. XCTest is part of the Swift SDK, so no external dependency is added.

Los cinco algoritmos se implementan en tres enfoques:

| Enfoque | Sufijo | Ejemplo | ¿Tiene suite propia? |
|---------|--------|---------|:--------------------:|
| Recursivo directo | `_rec` | `fibonacci_rec` | Sí |
| Recursivo con acumulador | `_acc` | `fibonacci_acc` | No, por la ausencia de TCO garantizada |
| Iterativo | `_ite` | `fibonacci_ite` | Sí |

**Combinación aplicada:** TCO no garantizada + iteración nativa (`for`/`while`) ✅ → `_rec` + `_ite` = **2 suites, 10 tests agrupados por método y 22 assertions**.

**Applied combination:** No guaranteed TCO + native iteration (`for`/`while`) ✅ → `_rec` + `_ite` = **2 suites, 10 tests grouped by method, and 22 assertions**.

### Inicialización / Initialization

```bash
mkdir -p swift/core/foundations/numbers
cd swift/core/foundations/numbers
swift package init --type library
```

Después se sustituyen los archivos generados por el módulo y las suites de este ejercicio.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `Package.swift`

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Numbers",
    products: [
        .library(
            name: "Numbers",
            targets: ["Numbers"]
        )
    ],
    targets: [
        .target(
            name: "Numbers"
        ),
        .testTarget(
            name: "NumbersTests",
            dependencies: ["Numbers"]
        )
    ]
)
```

| Elemento | Propósito |
|----------|-----------|
| `.library(...)` | Declara el producto de librería. |
| `.target(name: "Numbers")` | Declara el código de producción. |
| `.testTarget(...)` | Declara el target XCTest y su dependencia local. |

### Suites XCTest

Cada suite contiene cinco métodos de test, uno por algoritmo, y agrupa dentro de cada método los casos definidos por la especificación. `_acc` está implementado en la librería, pero no tiene una suite propia porque Swift no garantiza TCO.

Each suite contains five test methods, one per algorithm, and groups the specification cases within each method. `_acc` is implemented in the library but has no dedicated suite because Swift does not guarantee TCO.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- Swift 6.3.3.
- Swift Package Manager, incluido en el toolchain.
- XCTest, incluido en el SDK de Swift.

Verificar la instalación:

```bash
swift --version
swiftc --version
swift package --version
```

En este entorno Swift se gestiona mediante Swiftly; `~/.local/share/swiftly/env.sh` se carga desde los perfiles del shell.

### Ejecutar las pruebas / Run tests

```bash
cd swift/core/foundations/numbers
swift test
```

### Salida esperada / Expected output

```text
Test Suite 'IterativeTests' passed
         Executed 5 tests, with 0 failures
Test Suite 'RecursiveTests' passed
         Executed 5 tests, with 0 failures
Test Suite 'All tests' passed
         Executed 10 tests, with 0 failures
```

La ejecución verificada con Swift 6.3.3 produjo 10 tests XCTest exitosos, 0 fallos y 22 assertions agrupadas.

The run verified with Swift 6.3.3 produced 10 successful XCTest tests, 0 failures, and 22 grouped assertions.

---

## 🧠 Operaciones / Operations

| Función | `_rec` | `_acc` | `_ite` |
|---------|--------|--------|--------|
| `sum_of_first_n` | Recursión directa | Helper con acumulador | `for` |
| `factorial` | Recursión directa | Helper con acumulador | `for` |
| `fibonacci` | Dos llamadas recursivas | Dos acumuladores | `for` |
| `greatest_common_divisor` | Euclides recursivo | Helper de Euclides | `while` |
| `least_common_multiple` | Usa MCD y aritmética | Usa MCD y aritmética | Usa MCD y aritmética |

Las funciones `_acc` permanecen disponibles como puente educativo hacia las versiones iterativas, aunque no se prueban en una suite separada.

The `_acc` functions remain available as an educational bridge toward the iterative versions, although they are not tested in a separate suite.

---

## 📝 Notas de implementación / Implementation Notes

### 🔁 Recursión con acumulador y TCO / Accumulator recursion and TCO

**ES:** La recursión con acumulador deja la llamada recursiva como última operación del helper, pero Swift no ofrece una garantía general de Tail Call Optimization en su modelo estándar. Por eso `_acc` se conserva en `Numbers.swift` como puente didáctico, sin suite propia. La validación se centra en `_rec` e `_ite`, que cubren la combinación definida por la especificación para lenguajes sin TCO garantizada pero con bucles nativos.

**EN:** Accumulator recursion leaves the recursive call as the helper's final operation, but Swift does not provide a general Tail Call Optimization guarantee in its standard model. Therefore `_acc` remains in `Numbers.swift` as an educational bridge without its own suite. Validation focuses on `_rec` and `_ite`, which cover the specification's combination for languages without guaranteed TCO but with native loops.

- **ES:** Swift tiene iteración nativa mediante `for` y `while`; `_ite` no usa llamadas recursivas.
- **EN:** Swift has native iteration through `for` and `while`; `_ite` uses no recursive calls.
- **ES:** Los cinco algoritmos usan `Int` y los casos de prueba son los definidos por la especificación.
- **EN:** All five algorithms use `Int`, and the test cases are those defined by the specification.
- **ES:** `.build/` y `.swiftpm/` son artefactos locales de Swift Package Manager y quedan excluidos por `.gitignore`.
- **EN:** `.build/` and `.swiftpm/` are local Swift Package Manager artifacts excluded by `.gitignore`.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
