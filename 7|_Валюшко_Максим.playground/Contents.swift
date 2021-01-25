import UIKit

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

protocol Conditions {
    var deposit: Int {get set}
    var serverState: Bool {get set}
}

struct Drink {
    var name: String
    var price: Int
}

enum buyDrinks: Error {
    case drinkIsAnavaliable
    case notEnoughtDeposit
    case lostServerConnetction
}

class purchaseDrinks: Conditions {
    var deposit: Int
    var serverState: Bool
    init(yourDeposit: Int, serverState: Bool) {
        self.deposit = yourDeposit
        self.serverState = serverState
    }
    var Drinks = [
        "Coca-Cola": Drink(name: "Coca-Cola", price: 100),
        "Fanta": Drink(name: "Fanta", price: 100),
        "Sprite": Drink(name: "Sprite", price: 100),
        "Burn": Drink(name: "Burn", price: 200)
    ]
    func purchase(name: String, serverStatus: Bool) throws {
        guard let drink = Drinks[name]  else {
            throw buyDrinks.drinkIsAnavaliable
        }
        guard drink.price <= deposit else {
            throw buyDrinks.notEnoughtDeposit
        }
        guard serverState == true else {
            throw buyDrinks.lostServerConnetction
        }
        print("Вы успешно купили напиток \(drink.name) за \(drink.price) рублей.")
    }
}

let DrinksCollections = [
    1: "Coca-Cola",
    2: "Fanta",
    3: " ",
    4: "Sprite",
    5: "Burn"
]

func purchaseDrink(numberOfDrink: Int, buyDrink: purchaseDrinks) throws {
    let serverState = true
    let chooseADrink = DrinksCollections[numberOfDrink] ?? "Подача напитка"
    try buyDrink.purchase(name: chooseADrink, serverStatus: serverState)
}

var numberOfDrink = 5
var yourDeposit = 150
var serverStatus = true

do {
    try purchaseDrink(numberOfDrink: numberOfDrink, buyDrink: purchaseDrinks(yourDeposit: yourDeposit, serverState: serverStatus))
} catch buyDrinks.drinkIsAnavaliable {
    print("Вы выбрали напиток под номером \(numberOfDrink).\nНапиток закончился! Выбирите пожалуйста другой!")
} catch buyDrinks.notEnoughtDeposit {
    print("Вы выбрали напиток под номером \(numberOfDrink).\nНедостаточно средств!")
} catch buyDrinks.lostServerConnetction {
    print("Нет связи с банком! Попробуйте еще раз!")
}

