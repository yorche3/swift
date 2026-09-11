# Hello, User! — Swift

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Swift**, con un enfoque manual y minimalista.

Solicita un nombre mediante la entrada estándar y muestra un saludo personalizado.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hellouser.swift`](hellouser.swift) | Código fuente: solicita un nombre, lo lee desde la entrada estándar y muestra un saludo. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hellouser.swift  # Código fuente
└── README.md        # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente, sin Swift Package Manager ni herramientas de scaffolding. Un único archivo `.swift` es suficiente: Swift puede ejecutar el archivo como script o compilarlo a un ejecutable nativo con `swiftc`.

**EN:** The project was created manually, without Swift Package Manager or scaffolding tools. A single `.swift` file is enough: Swift can run the file as a script or compile it into a native executable with `swiftc`.

El flujo del programa es:

1. Mostrar el prompt con `print`.
2. Leer una línea con `readLine()`.
3. Usar `?? ""` para convertir una entrada ausente en una cadena vacía.
4. Interpolar el nombre en el saludo final.

The program flow is:

1. Display the prompt with `print`.
2. Read one line with `readLine()`.
3. Use `?? ""` to convert missing input into an empty string.
4. Interpolate the name into the final greeting.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p swift/core/foundations/hellouser
   ```

2. Escribir el archivo `hellouser.swift` con el código fuente.

3. Ejecutarlo con `swift` o compilarlo con `swiftc`.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de Swift Package Manager para este ejercicio.

```swift
print("Enter your name: ")
let name = readLine() ?? ""
print("Hello, \(name)!")
```

| Elemento | Propósito |
|----------|-----------|
| `print("Enter your name: ")` | Muestra el prompt y añade un salto de línea. |
| `readLine()` | Lee una línea desde la entrada estándar y devuelve un `String?`. |
| `?? ""` | Usa una cadena vacía cuando no hay una línea disponible. |
| `"Hello, \(name)!"` | Interpola el nombre dentro del saludo. |
| `print(...)` | Escribe el saludo final y añade un salto de línea. |

> **ES:** `readLine()` elimina el salto de línea introducido por Enter. En este programa el prompt termina con un salto de línea porque se usa `print` en lugar de `print(..., terminator: "")`.
> **EN:** `readLine()` removes the newline entered by pressing Enter. In this program the prompt ends with a newline because `print` is used instead of `print(..., terminator: "")`.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- **Swift toolchain**, disponible oficialmente para Linux y macOS.
- `swift`, para ejecutar el archivo como script.
- `swiftc`, para compilar un ejecutable nativo.
- Swift 6.3.3 en el entorno verificado.

Verificar la instalación:

```bash
swift --version
swiftc --version
```

En este entorno, Swift se gestiona mediante Swiftly. La configuración se carga desde `~/.local/share/swiftly/env.sh` en `~/.bashrc` y `~/.bash_profile`, lo que añade sus ejecutables al `PATH`.

In this environment, Swift is managed through Swiftly. The configuration is loaded from `~/.local/share/swiftly/env.sh` by `~/.bashrc` and `~/.bash_profile`, adding its executables to `PATH`.

### Ejecutar como script / Run as a script

```bash
cd swift/core/foundations/hellouser
printf 'Ada\n' | swift hellouser.swift
```

### Compilar y ejecutar / Compile and run

```bash
cd swift/core/foundations/hellouser
swiftc hellouser.swift -o hellouser
printf 'Ada\n' | ./hellouser
```

### Salida esperada / Expected output

Con la entrada `Ada`, la salida verificada es:

```text
Enter your name: 
Hello, Ada!
```

La ejecución como script y la ejecución del binario compilado fueron verificadas con Swift 6.3.3 en Linux.

Both script execution and the compiled binary were verified with Swift 6.3.3 on Linux.

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Swift permite código de nivel superior en un archivo ejecutable, por lo que no se necesita declarar una función `main`.
- **EN:** Swift allows top-level code in an executable file, so no `main` function is required.
- **ES:** `readLine()` devuelve un opcional (`String?`) porque la entrada puede terminar antes de proporcionar una línea.
- **EN:** `readLine()` returns an optional (`String?`) because input may end before providing a line.
- **ES:** El operador `??` proporciona un valor alternativo para el caso de entrada ausente.
- **EN:** The `??` operator provides a fallback value when input is missing.
- **ES:** El ejecutable generado por `swiftc` es un artefacto de compilación y no forma parte del código fuente del ejercicio.
- **EN:** The executable generated by `swiftc` is a build artifact and is not part of the exercise's source code.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
