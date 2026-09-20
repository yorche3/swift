// naive_sort — ordenamientos elementales O(n²).
//
// Especificación: 05_Naive_Sort
//
// Contrato: las tres funciones reciben un array de enteros y devuelven el array
// ordenado de menor a mayor (in-place o como copia ordenada), sin invocar
// `sorted()`, `sort()` ni ninguna otra ayuda de ordenamiento de la biblioteca
// estándar.
// API: los tres métodos estáticos del enum `NaiveSort` — `selection_sort`,
// `bubble_sort` e `insertion_sort`, con los nombres `snake_case` de la
// especificación, como en `core/foundations/numbers/`.
// Si el array está vacío o tiene un solo elemento se devuelve sin cambios. El
// caso nulo se omite: `[Int]` es un tipo de valor y no admite `nil`.
// No lanza excepciones.
//
// Implementación pendiente: la escribe el autor. Esta delegación solo genera el
// esqueleto y las pruebas unitarias.
public class NaiveSort {
  public static func selection_sort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
      return array
    }
    var result = array
    for i in 0..<result.count - 1 {
      var minIndex = i
      for j in i + 1..<result.count {
        if result[j] < result[minIndex] {
          minIndex = j
        }
      }
      if minIndex != i {
        result.swapAt(i, minIndex)
      }
    }
    return result
  }

  public static func bubble_sort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
      return array
    }
    var result = array
    for i in 0..<result.count - 1 {
      var swapped = false
      for j in 0..<result.count - 1 - i {
        if result[j] > result[j + 1] {
          result.swapAt(j, j + 1)
          swapped = true
        }
      }
      if !swapped {
        break
      }
    }
    return result
  }

  public static func insertion_sort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
      return array
    }
    var result = array
    for i in 1..<result.count {
      var j = i
      while j > 0 && result[j] < result[j - 1] {
        result.swapAt(j, j - 1)
        j -= 1
      }
    }
    return result
  }
}
