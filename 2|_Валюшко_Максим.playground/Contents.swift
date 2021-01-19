import UIKit
import Foundation
//1. Написать функцию, которая определяет, четное число или нет.
func getCheckEvenOrNot(someValue: Int) -> (){
    switch someValue {
    case _ where someValue % 2 == 0:
        print("Число \(someValue) четное!\n")
    default:
        print("Число \(someValue) нечетное!\n")
    }
}
getCheckEvenOrNot(someValue: 11)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func getCheckNumberDivOnThree(someValue: Int) -> (){
    switch someValue {
    case _ where someValue % 3 == 0:
        print("Число \(someValue) делится на 3 без остатка!\n")
    default:
        print("Число \(someValue) не делится на 3 без остатка!\n")
    }
}
getCheckNumberDivOnThree(someValue: 11)

//3. Создать возрастающий массив из 100 чисел.

var someArray: [Int] = []
for i in 1...100 {
    someArray.append(i)
}
print("Возрастающий массив из 100 чисел:\n\n\(someArray)\n")


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for i in someArray {
//    if (i % 2) == 0{
//        someArray.remove(at: someArray.firstIndex(of: i)!)
//    } else if (i % 3) != 0 {
//        someArray.remove(at: someArray.firstIndex(of: i)!)
//    }
    if (i % 2 == 0) || (i % 3 != 0) {
        someArray.remove(at: someArray.firstIndex(of: i)!)
    }
}
print("Удаление из массива всех четных чисел и всех чисел, которые не делятся на 3:\n\(someArray)\n")

///

var someArray2 : [Int] = []
for i in 1...20 {
    someArray2.append(i)
}
print(someArray2)

func even(number: Int) -> Bool {
    return number % 2 == 0 ? true : false
}
func divOnThree(number: Int) -> Bool {
    return number % 3 != 0 ? true : false
}
func deleteEvenAndDivOnThree (arrayGlobal: [Int]) -> [Int] {
    var array = arrayGlobal
    for elementArray in array {
        if even(number: elementArray) || divOnThree(number: elementArray) {
            array.remove(at: array.firstIndex(of: elementArray)!)
        }
    }
    return array
}
print("Удаление из массива всех четных чисел и всех чисел, которые не делятся на 3:\n\(deleteEvenAndDivOnThree (arrayGlobal: someArray2))\n")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func getFibonacciArray (length: Int) -> [Decimal]{
    var array: [Decimal] = [0, 1]
    for i in 2...length {
        array.append(array[i - 1] + array[i - 2])
    }
    return array
}
print("Массив из чисел Фибоначчи:\n\(getFibonacciArray(length: 100))\n")

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

func getPrimeNumbersArray (length: Int) -> [Int] {
    var intArray = [Int](2...length)
    var p = 2
    while p != 0 {
        for i in intArray {
            if let index = intArray.firstIndex(of: i * p) {
                intArray.remove(at: index)
            }
        }
        if let index = intArray.firstIndex(of: p), index != (intArray.endIndex - 1){
            p = intArray[index + 1]
        } else {
            p = 0
        }
    }
    return intArray
}
print("Массив простых чисел по методу Эратосфена:\n\(getPrimeNumbersArray(length: 100))")
