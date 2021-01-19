import UIKit
import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

protocol WashPrice{
    var washCost: Int {get set}
}
class WashingCars:CustomStringConvertible {
    var washCost: Int
    var car: String
    var number: String
    var howWash: String
    var description: String {
        return car + " - " + number + " " + "(" + howWash + ")"
    }
    init(car: String, number: String, howWash: String, washCost: Int) {
        self.car = car
        self.howWash = howWash
        self.number = number
        self.washCost = washCost
    }
}

struct Quene<Element:WashingCars> {
    var items = [Element]()
    mutating func enquene(_ item: Element){
        items.append(item)
    }
    mutating func dequene() -> Element? {
        return items.removeFirst()
    }
    var totalCost : Int {
        var washCost = 0
        for item in items {
            washCost += item.washCost
        }
        return washCost
    }
    subscript(indices: UInt ...) -> Int {
        var washCost = 0
        for index in indices where index < self.items.count {
            washCost += self.items[Int(index)].washCost
        }
        return washCost
    }
}
    
func enqueneCars(_ queneCollection: Quene<WashingCars>,_ car: String,_ number: String,_ howWash: String,_ washCost: Int) -> Quene<WashingCars> {
   queneOfCars.enquene(WashingCars(car: car, number: number, howWash: howWash, washCost: washCost))
    return queneOfCars
}

var queneOfCars = Quene()
let printQueneOfCars = {print("Автомобили в очереди: \(queneOfCars.items)")}

enqueneCars(queneOfCars, "Toyota", "904", "Верх", 250)
enqueneCars(queneOfCars, "Audi", "777", "Верх, салон и коврики", 500)
enqueneCars(queneOfCars, "BMW", "750", "Комплекс", 650)
enqueneCars(queneOfCars, "Nissan", "440", "Салон", 200)
enqueneCars(queneOfCars, "Lexus", "999", "Комплекс + полировка", 4500 )


printQueneOfCars()
queneOfCars.totalCost
queneOfCars[3]
queneOfCars.dequene()
printQueneOfCars()
