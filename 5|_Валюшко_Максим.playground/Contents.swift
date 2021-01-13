import UIKit
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum engineState: String {
    case on = "Включен"
    case off = "Выключен"
  }
enum doorState: String {
    case open = "Открыты"
    case close = "Закрыты"
}
enum windowsState: String {
    case open = "Открыты"
    case close = "Закрыты"
}

protocol Car {
    var brand: String {get}
    var name: String {get}
    var yearOfManufactured: UInt {get}
    var miliage: Double {get}
    var engineStatus: engineState {get set}
    var doorStatus: doorState {get set}
    var windowsStatus: windowsState {get set}
}

extension Car {
    func CarInfoState(){
        print("Состояние \(brand) \(name):\n Двигатель:\(engineStatus.rawValue)\n Двери: \(doorStatus.rawValue)\n")
    }
    mutating func StartEngine() {
        engineStatus = .on
        print("\(brand) \(name):\n Двигатель запущен!\n")
    }
    mutating func StopEngine() {
        engineStatus = .off
        print("\(brand) \(name):\n Двигатель выключен!\n")
        
    }
    mutating func OpenDoors() {
        doorStatus = .open
        print("\(brand) \(name):\n Двери открыты!\n")
    }
    mutating func CloseDoors() {
        doorStatus = .close
        print("\(brand) \(name):\n Двери закрыты!\n")
    }
    mutating func OpenWindows() {
        windowsStatus = .open
        print("\(brand) \(name):\n Окна открыты!\n")
    }
    mutating func CloseWindows() {
        windowsStatus = .close
        print("\(brand) \(name):\n Окна закрыты!\n")
    }
}

class SportCar: Car, CustomStringConvertible {
    enum exaustSelection: String {
        case loud = "Громкий"
        case normal = "Тихий"
    }
    
    var brand: String
    var name: String
    var yearOfManufactured: UInt
    var miliage: Double
    var engineStatus: engineState
    var doorStatus: doorState
    var windowsStatus: windowsState
    var exaustStatus: exaustSelection
    
    var description: String {
        return "Информация об автомобиле:\n Название: \(brand) \(name) \n  Год выпуска: \(yearOfManufactured) \n  Пробег: \(miliage) км\n"
    }
    
    init(brand: String, name: String, yearOfManufacrured: UInt, miliage: Double, engineStatus: engineState, doorStatus: doorState, windowsStatus: windowsState, exaustStatus: exaustSelection) {
        self.brand = brand
        self.name = name
        self.yearOfManufactured = yearOfManufacrured
        self.miliage = miliage
        self.engineStatus = engineStatus
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
        self.exaustStatus = exaustStatus
    }
    func CarInfoState(){
        print("Состояние \(brand) \(name):\n Двигатель: \(engineStatus.rawValue) \n Двери: \(doorStatus.rawValue) \n Окна: \(windowsStatus.rawValue) \n Режим выхлопа: \(exaustStatus.rawValue)\n")
    }
    func SwitchExaustLoud() {
        exaustStatus = .loud
        print("\(brand) \(name) :\n Выбран громкий режим выхлопа!\n")
    }
    func SwitchExaustNormal() {
        exaustStatus = .normal
        print("\(brand) \(name) :\n Выбран тихий режим выхлопа\n")
    }
}

class TruckCar: Car, CustomStringConvertible {
    enum transmissionModeState: String {
        case awd = "Полный"
        case fwd = "Передний"
    }
    
    var brand: String
    var name: String
    var yearOfManufactured: UInt
    var miliage: Double
    var engineStatus: engineState
    var doorStatus: doorState
    var windowsStatus: windowsState
    var transmissionMode: transmissionModeState
    
    var description: String {
        return "Информация о грузовом автомобиле:\n Название: \(brand) \(name) \n  Год выпуска: \(yearOfManufactured) \n  Пробег: \(miliage) км\n"
    }
    
    init(brand: String, name: String, yearOfManufactured: UInt, miliage: Double, engineStatus: engineState, transmissionMode: transmissionModeState, doorStatus: doorState, windowsStatus: windowsState){
        self.brand = brand
        self.name = name
        self.yearOfManufactured = yearOfManufactured
        self.miliage = miliage
        self.engineStatus = engineStatus
        self.transmissionMode = transmissionMode
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
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

var audi = SportCar(brand: "Audi", name: "RS6", yearOfManufacrured: 2017, miliage: 15000, engineStatus: .off, doorStatus: .close, windowsStatus: .close, exaustStatus: .normal)
var grandcherokee = SportCar(brand: "Grand Cherokee", name: "TrackHawk", yearOfManufacrured: 2019, miliage: 12000, engineStatus: .off, doorStatus: .close, windowsStatus: .close, exaustStatus: .normal)

var kamaz = TruckCar(brand: "KAMAZ", name: "5490", yearOfManufactured: 2017, miliage: 68700, engineStatus: .off, transmissionMode: .fwd, doorStatus: .close, windowsStatus: .close)
    
print(audi)
audi.OpenDoors()
audi.StartEngine()
audi.SwitchExaustLoud()
audi.CarInfoState()

print(grandcherokee)
grandcherokee.OpenDoors()
grandcherokee.OpenWindows()
grandcherokee.CarInfoState()

print(kamaz)
kamaz.OpenDoors()
kamaz.StartEngine()
kamaz.turnAwd()
kamaz.CarInfoState()
