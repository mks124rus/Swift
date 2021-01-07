import UIKit

//1. Решить квадратное уравнение:
//ax2 + bx + c = 0
//x2 − 8x + 12 = 0 - два корня
//5x2 + 3x + 7 = 0  - нет корней
//x2 − 6x + 9 = 0  - один корень
print("x2 − 8x + 12 = 0\n")
var a = 1
var b = -8
var c = 12
var d = b * b - (4 * a * c)
    if d < 0 {
        print("Дискриминант = \(d) меньше 0, значит уравнение не имеет корней.\n")
        print("Решение не возможно!")
    }
var sqrtD = sqrt(Double(d))
    if d > 0 {
        print("Дискриминант = \(d) больше 0, значит уравнение имеет два корня.\n")
        let x1 = (-b + Int(sqrtD)) / (2 * a)
        let x2 = (-b - Int(sqrtD)) / (2 * a)
        print("Корень 1 = \(x1)")
        print("Корень 2 = \(x2)\n")
        var answer1 = a * x1 * x1 + b * x1 + c
        print("Если корень 1 = \(x1) , то уравнение равно \(answer1)")
        var answer2 = a * x2 * x2 + b * x2 + c
        print("Если корень 2 = \(x2) , то уравнение равно \(answer2)\n\n")
    } else if d == 0 {
        let x = (-b + Int(sqrtD)) / (2 * a)
        print("Дискриминант = \(d)  равен 0, значит уравнение имеет один корень\n")
        print("Корень = \(x)\n")
        var answer1 = a * x * x + b * x + c
        print("Если корень = \(x) , то уравнение равно \(answer1)\n\n")
    }

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.\n")
var side1 = 10
var side2 = 15
var hypotenuse = Int(sqrt(Double(side1 * side1 + side2 * side2)))
print("Гипотенуза прямоугольного треугольника равна: \(hypotenuse)")
let p = side1 + side2 + hypotenuse
print("Периметр прямоугольного треугольника равен: \(p)")
let s = (side1 + side2) / 2
print("Площадь прямоугольного треугольника равна: \(s)\n\n")

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

print("Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.\n")
var userDeposit:Double = 15000
var userPercent = 7
print("Сумма вклада: \(userDeposit)\nПроцент: \(userPercent)\n")
for year in 1...5 {
    let sum = userDeposit + userDeposit * Double(1 + userPercent) * 0.01 * Double(year)
    let wordYear = ["год", "года", "лет"]
    if (year == 1){
        print("Сумма вклада через \(year) \(wordYear[0]) будет равна \(sum)")
    } else if (year == 2 || year == 3 || year == 4  ){
        print("Сумма вклада через \(year) \(wordYear[1]) будет равна \(sum)")
    } else if (year == 5){
        print("Сумма вклада через \(year) \(wordYear[2]) будет равна \(sum)")
    }
} 




