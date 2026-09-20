public class Numbers {
    public static func sum_of_first_n_rec(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        return n + sum_of_first_n_rec(n - 1)
    }

    public static func factorial_rec(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return n * factorial_rec(n - 1)
    }

    public static func fibonacci_rec(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fibonacci_rec(n - 1) + fibonacci_rec(n - 2)
    }

    public static func greatest_common_divisor_rec(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return greatest_common_divisor_rec(b, a % b)
    }

    public static func least_common_multiple_rec(_ a: Int, _ b: Int) -> Int {
        if a == 0 || b == 0 {
            return 0
        }
        return (a / greatest_common_divisor_rec(a, b)) * b
    }

    public static func sum_of_first_n_acc(_ n: Int) -> Int {
        func helper(_ current: Int, _ accumulator: Int) -> Int {
            if current <= 0 {
                return accumulator
            }
            return helper(current - 1, current + accumulator)
        }
        return helper(n, 0)
    }

    public static func factorial_acc(_ n: Int) -> Int {
        func helper(_ current: Int, _ accumulator: Int) -> Int {
            if current <= 1 {
                return accumulator
            }
            return helper(current - 1, current * accumulator)
        }
        return helper(n, 1)
    }

    public static func fibonacci_acc(_ n: Int) -> Int {
        func helper(_ position: Int, _ previous: Int, _ current: Int) -> Int {
            if position <= 0 {
                return previous
            }
            if position == 1 {
                return current
            }
            return helper(position - 1, current, previous + current)
        }
        return helper(n, 0, 1)
    }

    public static func greatest_common_divisor_acc(_ a: Int, _ b: Int) -> Int {
        func helper(_ x: Int, _ y: Int) -> Int {
            if y == 0 {
                return x
            }
            return helper(y, x % y)
        }
        return helper(a, b)
    }

    public static func least_common_multiple_acc(_ a: Int, _ b: Int) -> Int {
        if a == 0 || b == 0 {
            return 0
        }
        return (a / greatest_common_divisor_acc(a, b)) * b
    }

    public static func sum_of_first_n_ite(_ n: Int) -> Int {
        var result = 0
        for current in 1...max(n, 1) {
            if current <= n {
                result += current
            }
        }
        return result
    }

    public static func factorial_ite(_ n: Int) -> Int {
        var result = 1
        if n >= 2 {
            for current in 2...n {
                result *= current
            }
        }
        return result
    }

    public static func fibonacci_ite(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }

        var previous = 0
        var current = 1
        for _ in 2...n {
            let next = previous + current
            previous = current
            current = next
        }
        return current
    }

    public static func greatest_common_divisor_ite(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let remainder = x % y
            x = y
            y = remainder
        }
        return x
    }

    public static func least_common_multiple_ite(_ a: Int, _ b: Int) -> Int {
        if a == 0 || b == 0 {
            return 0
        }
        return (a / greatest_common_divisor_ite(a, b)) * b
    }
}
