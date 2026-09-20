# Swift

Proyectos en **Swift**, con scripts independientes ejecutados mediante `swift` o compilados con `swiftc`, y proyectos tipo librería gestionados con **Swift Package Manager** y probados con **XCTest**.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
| ------ | ----------- |
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `unit_test/calculator`, `numbers` |
| [`core/algorithms/`](core/algorithms/) | **Fase 1 — Algoritmos Puros**: `naive_sort` |

---

## ▶️ Comenzar / Getting Started

```bash
# Cargar Swiftly en la sesión actual
source "$HOME/.bashrc"

# Hello, World!
cd core/foundations/helloworld
swift helloworld.swift

# Hello, User!
cd ../hellouser
printf 'Ada\n' | swift hellouser.swift

# Calculator tests
cd ../unit_test/calculator
swift test

# Numbers tests
cd ../../numbers
swift test

# Naive Sort tests
cd ../../algorithms/naive_sort
swift test
```

---

## 📦 Requisitos / Requirements

| Herramienta | Uso | Verificación |
| ----------- | --- | ------------ |
| [Swift](https://www.swift.org/) 6.3.3 | Compilador y runtime | `swift --version` |
| Swift Package Manager | Gestionar librerías y tests | `swift package --version` |
| XCTest | Framework de pruebas | Incluido en el SDK de Swift |
| [Swiftly](https://www.swift.org/swiftly/) | Gestión del toolchain en este entorno | `swiftly --version` |

```bash
# Cargar la configuración de Swiftly
source "$HOME/.bashrc"

# Verificar la instalación
swift --version
swiftc --version
swift package --version
```

En este entorno, Swiftly se carga desde `~/.local/share/swiftly/env.sh` mediante los perfiles del shell y añade sus ejecutables al `PATH`.

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Programa independiente (`swift` / `swiftc`)

**ES:** `helloworld` y `hellouser` son archivos `.swift` de nivel superior. Se ejecutan directamente con `swift` o se compilan a binarios nativos con `swiftc`.

**EN:** `helloworld` and `hellouser` are top-level `.swift` files. They run directly with `swift` or compile to native binaries with `swiftc`.

```bash
swift <File>.swift
swiftc <File>.swift -o <binary>
./<binary>
```

### 2. Proyecto SwiftPM tipo librería

**ES:** `calculator` y `numbers` usan `Package.swift`, `Sources/` y `Tests/`. SwiftPM gestiona el target de librería y XCTest ejecuta las suites con `swift test`.

**EN:** `calculator` and `numbers` use `Package.swift`, `Sources/`, and `Tests/`. SwiftPM manages the library target, and XCTest runs the suites with `swift test`.

```bash
swift test
```

---

## 🔁 Decisión de TCO / TCO Decision

Swift dispone de iteración nativa mediante `for` y `while`, pero no garantiza Tail Call Optimization general. Por eso `numbers` conserva `_acc` como puente educativo sin suite propia y prueba `_rec` e `_ite`:

Swift has native iteration through `for` and `while`, but does not guarantee general Tail Call Optimization. Therefore `numbers` keeps `_acc` as an educational bridge without a dedicated suite and tests `_rec` and `_ite`:

```text
TCO no garantizada + iteración nativa ✅
_rec + _ite
2 suites
10 tests
22 assertions
```

---

## 🧪 Convenciones de pruebas / Testing Conventions

**ES:** Los proyectos SwiftPM usan XCTest. Cada suite agrupa los casos por método: un método de test por algoritmo con varias aserciones dentro. `swift test` compila la librería y ejecuta todas las suites.

**EN:** SwiftPM projects use XCTest. Each suite groups cases by method: one test method per algorithm with multiple assertions inside. `swift test` builds the library and runs all suites.

---

## 🧹 Artefactos de compilación / Build Artifacts

Swift Package Manager genera `.build/` y `.swiftpm/`. Los proyectos SwiftPM incluyen `.gitignore` locales para excluir esos artefactos.

Swift Package Manager generates `.build/` and `.swiftpm/`. SwiftPM projects include local `.gitignore` files to exclude those artifacts.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*