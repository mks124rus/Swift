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
    var description: String {
        return car + " - " + number + " "
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
    
func enqueneCars(_ queneCollection: Quene<WashingCars>,_ car: String,_ number: String,_ washCost: Int) -> Quene<WashingCars> {
    queneOfCars.enquene(WashingCars(car: car, number: number, washCost: washCost))
    return queneOfCars
}

var queneOfCars = Quene()
let printQueneOfCars = {print("Автомобили в очереди: \(queneOfCars.items)")}

enqueneCars(queneOfCars, "Toyota", "904", 450)
enqueneCars(queneOfCars, "Audi", "777", 550)
enqueneCars(queneOfCars, "BMW", "750", 750)
enqueneCars(queneOfCars, "Nissan", "440", 200)
enqueneCars(queneOfCars, "Lexus", "999", 900 )


printQueneOfCars()
print("Общий заработок: \(queneOfCars.totalCost) рублей")
queneOfCars.dequene()
printQueneOfCars()

let sortCars = queneOfCars.filtred(function: {$0.washCost > 300})
print(sortCars)
