public enum Calculator {
    public static func addition(_ a: Int, _ b: Int) -> Int {
        a + b
    }

    public static func subtraction(_ a: Int, _ b: Int) -> Int {
        a - b
    }

    public static func multiplication(_ a: Int, _ b: Int) -> Int {
        precondition(b >= 0, "The multiplier must be non-negative")

        var result = 0
        var count = 0
        while count < b {
            result = addition(result, a)
            count += 1
        }
        return result
    }

    public static func division(_ a: Int, _ b: Int) -> Int {
        precondition(b > 0, "The divisor must be positive")

        var dividend = a
        var quotient = 0
        while dividend >= b {
            dividend = subtraction(dividend, b)
            quotient += 1
        }
        return quotient
    }

    public static func modulus(_ a: Int, _ b: Int) -> Int {
        precondition(b > 0, "The divisor must be positive")

        let quotient = division(a, b)
        let product = multiplication(quotient, b)
        return subtraction(a, product)
    }
}
