import UIKit
import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//

protocol WashPrice{
    var washCost: Int {get set}
}

class WashingCars:CustomStringConvertible {
    var washCost: Int
    var car: String
    var number: String
    var description: String {
        return car + " - " + number
    }
    init(car: String, number: String, washCost: Int) {
        self.car = car
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
}

extension Quene {
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
    func filtred(function: (Element) -> Bool) -> [Element] {
        var arrayFiltred = [Element]()
        for i in items {
            if function(i){
                arrayFiltred.append(i)
            }
        }
        return arrayFiltred
    }
}

func addCar(_ queneCollection: Quene<WashingCars>,_ car: String,_ number: String,_ washCost: Int) -> Quene<WashingCars> {
   queneOfCars.enquene(WashingCars(car: car, number: number, washCost: washCost))
    return queneOfCars
}

var queneOfCars = Quene()
let printQueneOfCars = {print("Автомобили в очереди: \(queneOfCars.items)")}

addCar(queneOfCars, "Toyota", "904", 250)
addCar(queneOfCars, "Audi", "777", 700)
addCar(queneOfCars, "BMW", "750", 650)
addCar(queneOfCars, "Nissan", "440",200)
addCar(queneOfCars, "Lexus", "999", 1500 )

printQueneOfCars()
print("Выручка составила \(queneOfCars.totalCost) рублей")
let sortCar = queneOfCars.filtred(function: {$0.washCost > 1000})
print(sortCar)
queneOfCars[3,4]
queneOfCars.dequene()
printQueneOfCars()

