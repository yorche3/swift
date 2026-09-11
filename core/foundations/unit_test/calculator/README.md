# Calculator — Swift

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Swift**, usando una estructura de librería de **Swift Package Manager** y **XCTest** para las pruebas unitarias.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`Package.swift`](Package.swift) | Manifiesto del paquete, producto de librería y target de pruebas. |
| [`Sources/Calculator/Calculator.swift`](Sources/Calculator/Calculator.swift) | Implementación de las cinco operaciones de `Calculator`. |
| [`Tests/CalculatorTests/CalculatorTests.swift`](Tests/CalculatorTests/CalculatorTests.swift) | Suite XCTest con cinco pruebas agrupadas por operación. |
| [`.gitignore`](.gitignore) | Ignora `.build/` y `.swiftpm/`. |

```text
calculator/
├── Package.swift
├── Sources/
│   └── Calculator/
│       └── Calculator.swift
├── Tests/
│   └── CalculatorTests/
│       └── CalculatorTests.swift
├── .gitignore
└── README.md
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó como una librería Swift con Swift Package Manager. El código público vive en `Sources/Calculator` y las pruebas en `Tests/CalculatorTests`. XCTest forma parte del SDK de Swift, por lo que no se añade una dependencia externa de testing.

**EN:** The project was created as a Swift library with Swift Package Manager. Public code lives in `Sources/Calculator`, and tests live in `Tests/CalculatorTests`. XCTest is part of the Swift SDK, so no external testing dependency is added.

Las operaciones siguen las implementaciones educativas de la especificación:

- `addition`: suma directa.
- `subtraction`: resta directa.
- `multiplication`: suma repetitiva, sin usar `*`.
- `division`: resta repetitiva, sin usar `/`.
- `modulus`: reutiliza `division` y `multiplication`, sin usar `%`.

### Inicialización / Initialization

```bash
mkdir -p swift/core/foundations/unit_test/calculator
cd swift/core/foundations/unit_test/calculator
swift package init --type library
```

Después se sustituyen los archivos generados por la implementación y la suite de pruebas de este ejercicio.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `Package.swift`

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Calculator",
    products: [
        .library(
            name: "Calculator",
            targets: ["Calculator"]
        )
    ],
    targets: [
        .target(
            name: "Calculator"
        ),
        .testTarget(
            name: "CalculatorTests",
            dependencies: ["Calculator"]
        )
    ]
)
```

| Elemento | Propósito |
|----------|-----------|
| `.library(...)` | Declara el producto de librería que puede consumir otro target. |
| `.target(name: "Calculator")` | Declara el código de producción. |
| `.testTarget(...)` | Declara el target de pruebas y su dependencia local. |
| `XCTest` | Framework de testing incluido en el SDK de Swift. |

> **ES:** La suite usa `@testable import Calculator` para acceder al módulo durante las pruebas. Los cinco métodos de prueba están organizados uno por operación.
> **EN:** The suite uses `@testable import Calculator` to access the module during testing. The five test methods are organized one per operation.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- Swift 6.3.3.
- Swift Package Manager, incluido en el toolchain de Swift.
- XCTest, incluido en el SDK de Swift.

Verificar el entorno:

```bash
swift --version
swiftc --version
swift package --version
```

En este entorno Swift se gestiona mediante Swiftly; `~/.local/share/swiftly/env.sh` se carga desde los perfiles del shell y añade `swift` y `swiftc` al `PATH`.

### Ejecutar las pruebas / Run tests

```bash
cd swift/core/foundations/unit_test/calculator
swift test
```

### Salida esperada / Expected output

```text
Test Suite 'All tests' passed
Executed 5 tests, with 0 failures
```

> **ES:** El formato puede variar entre versiones de Swift/XCTest, pero deben ejecutarse 5 pruebas y producirse 0 fallos.
> **EN:** The format may vary across Swift/XCTest versions, but 5 tests must run with 0 failures.

---

## 🧠 Operaciones / Operations

| Operación | Implementación educativa |
|-----------|--------------------------|
| `addition(a, b)` | Suma directa (`a + b`). |
| `subtraction(a, b)` | Resta directa (`a - b`). |
| `multiplication(a, b)` | Suma `a` repetidamente `b` veces mediante `while`. |
| `division(a, b)` | Resta `b` repetidamente y cuenta el cociente entero. |
| `modulus(a, b)` | Calcula `a - multiplication(division(a, b), b)`. |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** La API usa `Int` y los casos de prueba emplean los valores definidos por la especificación.
- **EN:** The API uses `Int`, and the test cases use the values defined by the specification.
- **ES:** `multiplication` rechaza multiplicadores negativos y `division`/`modulus` rechazan divisores no positivos mediante `precondition`; esos casos están fuera del alcance de este ejercicio.
- **EN:** `multiplication` rejects negative multipliers, and `division`/`modulus` reject non-positive divisors through `precondition`; those cases are outside this exercise's scope.
- **ES:** XCTest proporciona el runner y el reporte, por lo que no se crea un archivo `run_tests.swift` adicional.
- **EN:** XCTest provides the runner and reporting, so no additional `run_tests.swift` file is created.
- **ES:** `.build/` y `.swiftpm/` son artefactos locales de Swift Package Manager y quedan excluidos por `.gitignore`.
- **EN:** `.build/` and `.swiftpm/` are local Swift Package Manager artifacts and are excluded by `.gitignore`.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
