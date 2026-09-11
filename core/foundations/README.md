# 🚀 Fundamentos / Foundations — Swift

Implementación de los ejercicios de la sección [Fundamentos / Foundations](https://yorche3.github.io/programming_languages/core/foundations/) del repositorio principal en **Swift**.

---

## 📖 Descripción / Description

**ES:** Esta sección reúne los conceptos esenciales para empezar a trabajar con Swift. Comienza con scripts independientes y continúa con proyectos tipo librería gestionados por Swift Package Manager y probados con XCTest.

**EN:** This section brings together the essential concepts for getting started with Swift. It begins with standalone scripts and continues with library-style projects managed by Swift Package Manager and tested with XCTest.

---

## 📁 Estructura / Structure

```text
swift/
└── core/
    └── foundations/
        ├── README.md                   # Este archivo / This file
        ├── helloworld/                 # 01_Hello_World — Primer script
        │   ├── helloworld.swift
        │   └── README.md
        ├── hellouser/                  # 02_Hello_User — Entrada estándar
        │   ├── hellouser.swift
        │   └── README.md
        ├── unit_test/
        │   └── calculator/             # 03_Unit_Test_Calculator
        │       ├── Package.swift
        │       ├── Sources/
        │       │   └── Calculator/
        │       │       └── Calculator.swift
        │       ├── Tests/
        │       │   └── CalculatorTests/
        │       │       └── CalculatorTests.swift
        │       ├── .gitignore
        │       └── README.md
        └── numbers/                    # 04_Numbers — Algoritmos numéricos
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

## 🔢 Progresión / Progression

| Especificación | Proyecto | Conceptos | Tests | Dependencias |
| -------------- | -------- | --------- | :---: | ------------ |
| [`01_Hello_World`](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | [`helloworld/`](helloworld/) | código de nivel superior, `print`, ejecución con `swift`/`swiftc` | — | Solo Swift |
| [`02_Hello_User`](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | [`hellouser/`](hellouser/) | `readLine`, opcionales, interpolación de cadenas | — | Solo Swift |
| [`03_Unit_Test_Calculator`](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | [`unit_test/calculator/`](unit_test/calculator/) | SwiftPM, librería, XCTest, `@testable import` | 5 | XCTest incluido |
| [`04_Numbers`](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | [`numbers/`](numbers/) | recursión, acumuladores, `for`, `while`, TCO | 10 (22 assertions) | XCTest incluido |

---

## 🛠️ Enfoque general / General Approach

**ES:** Los proyectos de esta sección siguen una progresión gradual:

1. **Hello World** y **Hello User**: scripts independientes de un solo archivo `.swift`, ejecutados con `swift` o compilados con `swiftc`.
2. **Calculator**: primer proyecto tipo librería con Swift Package Manager. Separa `Sources/` y `Tests/`, y usa XCTest para cinco operaciones aritméticas educativas.
3. **Numbers**: proyecto SwiftPM con 15 métodos distribuidos en tres enfoques. Swift tiene `for`/`while`, pero no garantiza TCO general; por eso se prueban `_rec` y `_ite`, mientras `_acc` permanece como puente didáctico sin suite propia.

**EN:** The projects in this section follow a gradual progression:

1. **Hello World** and **Hello User**: single-file `.swift` scripts run with `swift` or compiled with `swiftc`.
2. **Calculator**: the first Swift Package Manager library project. It separates `Sources/` and `Tests/` and uses XCTest for five educational arithmetic operations.
3. **Numbers**: a SwiftPM project with 15 methods across three approaches. Swift has `for`/`while`, but does not guarantee general TCO; therefore `_rec` and `_ite` are tested, while `_acc` remains an educational bridge without its own suite.

---

## 📦 Requisitos / Requirements

| Herramienta | Uso | Verificación |
| ----------- | --- | ------------ |
| Swift 6.3.3 | Compilador y runtime | `swift --version` |
| Swift Package Manager | Crear, compilar y probar librerías | `swift package --version` |
| XCTest | Framework de pruebas | Incluido en el SDK |
| Swiftly | Gestión del toolchain en este entorno | `swiftly --version` |

En este entorno Swift se gestiona mediante Swiftly. La configuración se carga desde `~/.local/share/swiftly/env.sh` mediante los perfiles del shell y añade los ejecutables al `PATH`.

```bash
source "$HOME/.bashrc"
swift --version
swiftc --version
swift package --version
```

---

## 🚀 Ejecución rápida / Quick Start

### Hello World

```bash
cd swift/core/foundations/helloworld
swift helloworld.swift
```

También puede compilarse:

```bash
swiftc helloworld.swift -o helloworld
./helloworld
```

### Hello User

```bash
cd swift/core/foundations/hellouser
printf 'Ada\n' | swift hellouser.swift
```

### Calculator

```bash
cd swift/core/foundations/unit_test/calculator
swift test
```

Resultado verificado:

```text
Executed 5 tests, with 0 failures
```

### Numbers

```bash
cd swift/core/foundations/numbers
swift test
```

Resultado verificado:

```text
Executed 10 tests, with 0 failures
```

---

## 🧪 Convenciones de pruebas / Testing Conventions

**ES:** Los proyectos tipo librería usan Swift Package Manager y XCTest. Cada suite agrupa los casos por método: un método de test por algoritmo, con las aserciones de sus entradas dentro del método.

**EN:** Library-style projects use Swift Package Manager and XCTest. Each suite groups cases by method: one test method per algorithm, with the input assertions inside that method.

`calculator` tiene cinco tests y `numbers` tiene dos suites con cinco tests cada una. En `numbers`, esto representa 22 assertions: 11 para `_rec` y 11 para `_ite`.

`calculator` has five tests, and `numbers` has two suites with five tests each. In `numbers`, this represents 22 assertions: 11 for `_rec` and 11 for `_ite`.

---

## 🔁 TCO e iteración / TCO and Iteration

Swift dispone de iteración nativa mediante `for` y `while`, pero no garantiza Tail Call Optimization general. Según la regla de `04_Numbers`, la combinación aplicada es:

Swift provides native iteration through `for` and `while`, but does not guarantee general Tail Call Optimization. According to the `04_Numbers` rule, the applied combination is:

```text
TCO no garantizada + iteración nativa ✅
_rec + _ite
2 suites
10 tests
22 assertions
```

La implementación `_acc` se conserva en `Numbers.swift` para mostrar la transformación desde recursión directa hacia un estado acumulado, pero no se prueba como enfoque independiente.

The `_acc` implementation remains in `Numbers.swift` to show the transformation from direct recursion toward accumulated state, but it is not tested as an independent approach.

---

## 🧹 Artefactos de compilación / Build Artifacts

Swift Package Manager genera `.build/` y `.swiftpm/`. Los proyectos con SwiftPM incluyen `.gitignore` locales para excluir esos artefactos.

Swift Package Manager generates `.build/` and `.swiftpm/`. SwiftPM projects include local `.gitignore` files to exclude those artifacts.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
