# 🚀 Algoritmos Puros / Algorithms Pure — Swift

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Swift**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase trabajan sobre **arrays de valor** (`[Int]`), que se ordenan sobre una copia local y se devuelven ordenados. `[Int]` no admite `nil`, así que el caso nulo no es representable en la firma.

---

## 📂 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `swift build` + `swift test` (XCTest) | 21 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
└── naive_sort/                          # 05_Naive_Sort
    ├── Package.swift                    # swift-tools-version 6.3, target + testTarget
    ├── .gitignore                       # .build/, .swiftpm/ y artefactos de Xcode
    ├── Sources/NaiveSort/
    │   └── NaiveSort.swift              # 3 métodos estáticos
    ├── Tests/NaiveSortTests/
    │   └── NaiveSortTests.swift         # 3 tests × 7 casos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Swift 6.3.3 (XCTest incluido en el SDK); en este entorno el toolchain se gestiona con Swiftly |
| **CLI** | `swift build` (verificación estática) y `swift test`, desde la raíz del paquete |
| **Andamiaje** | 🔧 `swift package init --type library --name <Nombre>` (comando de la guía), como en [`foundations/numbers/`](../foundations/numbers/) |
| **Framework de tests** | XCTest (`XCTestCase` + `XCTAssertEqual`), sin dependencias externas |
| **Runner** | `swift test` descubre `Tests/<Nombre>Tests/`; no hay `run_tests.swift` |
| **Separación** | `Sources/<Nombre>/` (librería) ↔ `Tests/<Nombre>Tests/` (suites) |
| **Módulo fuente** | Un tipo con métodos estáticos y públicos (`NaiveSort.selection_sort(…)`), como `Numbers` y `Calculator` |
| **API** | Una función por algoritmo: `public static func <algoritmo>(_ array: [Int]) -> [Int]` |
| **Naming** | `snake_case` idéntico al de la especificación (`selection_sort`), como en los otros módulos Swift del repositorio; los tests usan `camelCase` (`testSelectionSort`) |
| **Semántica de valor** | `[Int]` es un tipo de valor: los algoritmos ordenan una copia local y devuelven el array nuevo; los fixtures no se contaminan |
| **Nulabilidad** | `[Int]` no admite `nil`: el caso nulo no es representable y se omite (la fase todavía no usa `Optional`) |
| **Mensajes de aserción** | `XCTAssertEqual(actual, expected, "\(algorithm) should sort \(caso)")` con el mensaje del contrato |
| **Verificación estática** | `swift build` sin warnings |
| **Artefactos** | `.build/`, `.swiftpm/` (y `.DS_Store`, `DerivedData/`, `xcuserdata/`) — ignorados por el `.gitignore` del módulo |
| **Particularidades** | Rangos semiabiertos (`0..<count - 1`, `0..<count - 1 - i`) para los `for` del pseudocódigo; el intercambio es `Array.swapAt`; `insertion_sort` desplaza con `swapAt(j, j - 1)` mientras el vecino sea estrictamente mayor |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
swift build
swift test
```

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
