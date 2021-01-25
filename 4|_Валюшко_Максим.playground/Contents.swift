import Foundation
import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


class Car {
    enum doorState: String {
        case open = "Открыты"
        case close = "Закрыты"
    }
    enum engineState: String {
        case on = "Запущен"
        case off = "Выключен"
    }
    enum transmissionInfo: String {
        case auto = "Автомат"
        case manual = "Механика"
    }
    enum windowsState: String {
        case open = "Открыты"
        case close = "Закрыты"
    }
    enum trunkState: String {
        case open = "Открыт"
        case close = "Закрыт"
        case none = "Отсутствует"
    }
    
    let brand: String
    let name: String
    let transmission: transmissionInfo
    var miliage: Double
    var doorStatus: doorState
    var windowsStatus: windowsState
    var engineStatus: engineState
    var trunkStatus: trunkState
    
    init(brand: String, name: String, transmission: transmissionInfo, miliage: Double, doorStatus: doorState, windowsStatus: windowsState, engineStatus: engineState, trunkStatus: trunkState) {
        self.brand = brand
        self.name = name
        self.transmission = transmission
        self.miliage = miliage
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus
        self.trunkStatus = trunkStatus
    }
    
    func carInfo(){
        print("Информация об автомобиле:\n Название: \(brand) \(name)\n Трансмиссия: \(transmission.rawValue)\n Пробег \(miliage) км\n Двери: \(doorStatus.rawValue)\n Окна: \(windowsStatus.rawValue)\n Двигатель: \(engineStatus.rawValue)\n Багажник: \(trunkStatus.rawValue)\n")

    }
    
    func StartEngine() {
        engineStatus = .on
        print("\(brand) \(name) :\n Двигатель запущен!\n")
    }
    func StopEngine() {
        engineStatus = .off
        print("\(brand) \(name) :\n Двигатель остановлен!\n")
    }
    func OpenDoors() {
        doorStatus = .open
        print("\(brand) \(name) :\n Двери открыты!\n")
    }
    func CloseDoors() {
        doorStatus = .close
        print("\(brand) \(name) :\n Двери закрыты!\n")
    }
    func OpenWindows() {
        windowsStatus = .open
        print("\(brand) \(name) :\n Окна открыты!\n")
    }
    func CloseWindows() {
        windowsStatus = .close
        print("\(brand) \(name) :\n Окна закрыты!\n")
    }
    func OpenTrunk() {
        trunkStatus = .open
        print("\(brand) \(name) :\n Багажник открыт!\n")
    }
    func CloseTrunk() {
        trunkStatus = .close
        print("\(brand) \(name) :\n Багажник закрыт!\n")
    }
    func OpenAll() {
        doorStatus = .open
        windowsStatus = .open
        trunkStatus = .open
        print("\(brand) \(name) :\n Окна, двери и багажник открыты!\n")
    }
    func CloseAll() {
        doorStatus = .close
        windowsStatus = .close
        trunkStatus = .close
        print("\(brand) \(name) :\n Окна, двери и багажник закрыты!\n")
    }
    
}


class SportCar: Car {
    enum turboAvaliable: String {
        case yes = "Есть"
        case no = "Нет"
    }
    enum suspensionSelection: String {
        case sport = "Спортивная"
        case normal = "Комфорт"
    }
    enum seatsSelection: String {
        case sport = "Спортивные"
        case normal = "Комфорт"
    }
    let turbo: turboAvaliable
    let suspension: suspensionSelection
    let seats: seatsSelection
    
    init(brand: String, name: String, transmission: Car.transmissionInfo, turbo: turboAvaliable, suspension: suspensionSelection, seats: seatsSelection, miliage: Double, doorStatus: Car.doorState, windowsStatus: Car.windowsState, engineStatus: Car.engineState, trunkStatus: Car.trunkState) {
        self.turbo = turbo
        self.suspension = suspension
        self.seats = seats
        super.init(brand: brand, name: name, transmission: transmission, miliage: miliage, doorStatus: doorStatus, windowsStatus: windowsStatus, engineStatus: engineStatus, trunkStatus: trunkStatus)
    }

    override func carInfo(){
        super.carInfo()
        print("\(brand) \(name)\n Опции спортивной версии:\n  Турбо: \(turbo.rawValue)\n  Подвеска: \(suspension.rawValue)\n  Сидения: \(seats.rawValue)\n")
    }
}

class TruckCar: Car{
    enum transmissionModeState: String {
        case awd = "Полный"
        case fwd = "Передний"
    }
    enum frontBridgeModeState: String {
        case on = "Включен"
        case off = "Выключен"
    }
    enum trunkState {
        case none
    }
    var transmissionMode: transmissionModeState
    
    init(brand: String, name: String, transmission: Car.transmissionInfo, transmissionMode: transmissionModeState, miliage: Double, doorStatus: Car.doorState, windowsStatus: Car.windowsState, engineStatus: Car.engineState, trunkStatus: Car.trunkState) {
        self.transmissionMode = transmissionMode
        super.init(brand: brand, name: name, transmission: transmission, miliage: miliage, doorStatus: doorStatus, windowsStatus: windowsStatus, engineStatus: engineStatus, trunkStatus: trunkStatus)
    }
    override func OpenTrunk() {
        super.trunkStatus = .open
        print("\(brand) \(name) :\n Ошибка! В данном автомобиле багажник отсутсвует!\n")
    }
    override func CloseTrunk() {
        super.trunkStatus = .close
        print("\(brand) \(name) :\n Ошибка! В данном автомобиле багажник отсутсвует!\n")
    }
    override func carInfo(){
        super.carInfo()
        print("\(brand) \(name)\n Включен привод: \(transmissionMode.rawValue)\n")
    }
    func turnAwd(){
        transmissionMode = .awd
        print("\(brand) \(name) :\n Полный привод включен! \n")
    }
    func turnFwd(){
        transmissionMode = .fwd
        print("\(brand) \(name) :\n Включен передний привод! \n")
    }
    
}

var audiA4 = Car(brand: "Audi", name: "A4", transmission: .auto, miliage: 51245, doorStatus: .close, windowsStatus: .close, engineStatus: .off, trunkStatus: .close)

var toyotaCorolla = Car(brand: "Toyota", name: "Corolla", transmission: .manual, miliage: 125687, doorStatus: .open, windowsStatus: .close, engineStatus: .off, trunkStatus: .close)


var audiS4 = SportCar(brand: "Audi", name: "S4", transmission: .auto, turbo: .yes, suspension: .sport, seats: .sport, miliage: 15120, doorStatus: .close, windowsStatus: .open, engineStatus: .on, trunkStatus: .close)

var toyotaSupra = SportCar(brand: "Toyota", name: "Supra", transmission: .manual, turbo: .yes, suspension: .sport,seats: .sport, miliage: 124785, doorStatus: .open, windowsStatus: .close, engineStatus: .on, trunkStatus: .close)


var kamaz = TruckCar(brand: "KAMAZ", name: "5490", transmission: .manual, transmissionMode: .fwd, miliage: 78613, doorStatus: .close, windowsStatus: .close, engineStatus: .off, trunkStatus: .none)


audiA4.carInfo()
audiS4.carInfo()
toyotaCorolla.carInfo()
toyotaSupra.carInfo()
kamaz.carInfo()

audiA4.StartEngine()
audiS4.OpenTrunk()
toyotaCorolla.OpenAll()
toyotaSupra.StopEngine()
kamaz.OpenTrunk()
kamaz.turnAwd()
