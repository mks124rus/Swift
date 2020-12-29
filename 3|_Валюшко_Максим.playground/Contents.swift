import UIKit
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

enum engineState:String {
    case on, start = "Включен"
    case off, stop = "Выключен"
}
enum doorState:String {
    case open = "Открыты"
    case close = "Закрыты"
}
enum windowState:String {
    case open = "Открыты"
    case close = "Закрыты"
}


struct sportCar{

    let brand: String
    let model: String
    let generation: String
    let yearOfManufacture: Int
    let nameEngine: String
    let engineDisplacement: Int
    let enginePower: Int
    var trunkCapacity: Int
    var fuelTankCapacity: UInt
    var miliage: UInt
    var engineStatus: engineState
    var doorStatus: doorState
    var windowStatus: windowState
    
    func Description() {
        print("Марка автомобиля: \(brand)\nМодель: \(model)\nПоколение: \(generation)\nГод выпуска: \(yearOfManufacture)\nМодель двигателя: \(nameEngine)\nОбъем двигателя: \(engineDisplacement) куб.см\nМощность двигателя: \(enginePower ) л.с.\nОбъем багажника: \(trunkCapacity) л\nОбъем топливного бака: \(fuelTankCapacity) л\nПробег: \(miliage) км\n\n")
    }

    func CarInfo() {
        print("Состояние \(brand) \(model) (\(generation)):\n Объем багажника с учетом загрузки: \(trunkCapacity) л\n Осталось топлива: \(fuelTankCapacity) л\n Пробег: \(miliage) км\n Двигатель: \(engineStatus.rawValue)\n Двери: \(doorStatus.rawValue)\n Окна: \(windowStatus.rawValue)\n\n")
    }

    mutating func StartEngine() {
        engineStatus = .start
        print("\(brand) \(model) (\(generation)):\n Двигатель запущен\n")
    }
    mutating func StopEngine() {
        engineStatus = .stop
        print("\(brand) \(model) (\(generation)):\n Двигатель выключен\n")
    }
    mutating func OpenDoor() {
        self.doorStatus = .open
        print("\(brand) \(model) (\(generation)):\n Двери открыты\n")
    }
    mutating func CloseDoor() {
        self.doorStatus = .close
        print("\(brand) \(model) (\(generation)):\n Двери закрыты\n")
    }
    mutating func OpenWindows() {
        windowStatus = .open
        print("\(brand) \(model) (\(generation)):\n Окна открыты\n")
    }
    mutating func CloseWindows() {
        windowStatus = .close
        print("\(brand) \(model) (\(generation)):\n Окна закрыты\n")
    }
    mutating func Drive(km: UInt) {
        let fuelChange = (km * 10) / 100
        if fuelChange < fuelTankCapacity {
            miliage += km
            fuelTankCapacity -= fuelChange
            print("\(brand) \(model) (\(generation)):\n Автомобиль проехал \(km) км, осталось топлива \(fuelTankCapacity) л\n")
        } else if fuelTankCapacity == 0 {
            miliage += km
            print("\(brand) \(model) (\(generation)):\n Автомобиль проехал \(km) км, топливо закончилось! Пожалуйста заправтесь!\n")
        } else {
            print("\(brand) \(model) (\(generation))")
            print("Двигатель заглох! Нет топлива! Пожалуйста заправтесь!\n")
            engineStatus = .stop
            fuelTankCapacity = 0
        }
    }

    mutating func LoadTrunk(volume: Int){
            if volume < trunkCapacity && trunkCapacity != 0 {
                trunkCapacity -= volume
                print("\(brand) \(model) (\(generation))")
                print(" Загрузка багажника на \(volume) л\n В багажнике осталось свободно \(trunkCapacity) л\n")
            } else if volume == trunkCapacity {
                trunkCapacity -= volume
                print("\(brand) \(model) (\(generation)):\n Багажник заполнен полностью!\n")
            } else {
                print("\(brand) \(model) (\(generation)):\n Вы ввели неверное значение или превысили объем багажника!\n")
            }

        }


    }
struct truckCar{

    let brand: String
    let model: String
    let yearOfManufacture: Int
    let engineDisplacement: Double
    let enginePower: Int
    var trunkCapacity: Int
    var miliage: UInt
    var engineStatus: engineState
    var doorStatus: doorState
    var windowStatus: windowState
   
    func Description() {
        
        print("Марка грузового автомобиля: \(brand)\nМодель: \(model)\nГод выпуска: \(yearOfManufacture)\nОбъем двигателя: \(engineDisplacement) л\nМощность двигателя: \(enginePower ) л.с.\nОбъем кузова: \(trunkCapacity) л\nПробег: \(miliage) км\n\n")
    }
    func TruckInfo() {
        print("Состояние \(brand) \(model):\n Объем кузова с учетом загрузки: \(trunkCapacity) л\n Пробег: \(miliage) км\n Двигатель: \(engineStatus.rawValue)\n Двери: \(doorStatus.rawValue)\n Окна: \(windowStatus.rawValue)\n\n")
    }
    mutating func StartEngine() {
        engineStatus = .start
        print("\(brand) \(model):\n Двигатель запущен\n")
    }
    mutating func StopEngine() {
        engineStatus = .stop
        print("\(brand) \(model):\n Двигатель выключен\n")
    }
    mutating func OpenDoor() {
        self.doorStatus = .open
        print("\(brand) \(model):\n Двери открыты\n")
    }
    mutating func CloseDoor() {
        self.doorStatus = .close
        print("\(brand) \(model):\n Двери закрыты\n")
    }
    mutating func OpenWindows() {
        windowStatus = .open
        print("\(brand) \(model):\n Окна открыты\n")
    }
    mutating func CloseWindows() {
        windowStatus = .close
        print("\(brand) \(model):\n Окна закрыты\n")
    }
    
    mutating func LoadTrunk(goods: Int){
            if goods < trunkCapacity && trunkCapacity != 0 {
                trunkCapacity -= goods
                print("\(brand) \(model)")
                print(" Загрузка кузова на \(goods) л\n В кузове осталось свободно \(trunkCapacity) л\n")
            } else if goods == trunkCapacity {
                trunkCapacity -= goods
                print("\(brand) \(model):\n Кузов загружен полностью!\n")
            } else {
                print("\(brand) \(model):\n Вы ввели неверное значение или превысили объем кузова!\n")
            }
        }
    
    mutating func Drive(km: UInt) {
            miliage += km
            print("\(brand) \(model) :\n Грузовик проехал \(km) км\n")
    }
}

var audi = sportCar(brand: "Audi", model: "A4", generation: "B8", yearOfManufacture: 2013, nameEngine: "CJEB", engineDisplacement: 1798, enginePower: 170, trunkCapacity: 480, fuelTankCapacity: 63, miliage: 65123, engineStatus: .off, doorStatus: .close, windowStatus: .close)

var toyota = sportCar(brand: "Toyota", model: "Supra", generation: "A80", yearOfManufacture: 1996, nameEngine: "2JZ-GTE", engineDisplacement: 2997, enginePower: 330, trunkCapacity: 185, fuelTankCapacity: 80, miliage: 129583, engineStatus: .off, doorStatus: .close, windowStatus: .close)

var volvo = truckCar(brand: "Volvo", model: "FM 8x4", yearOfManufacture: 2013, engineDisplacement: 12.8, enginePower: 420, trunkCapacity: 20000, miliage: 198520, engineStatus: .off, doorStatus: .close, windowStatus: .close)

audi.Description()
audi.OpenDoor()
audi.StartEngine()
audi.OpenWindows()
audi.Drive(km: 450)
audi.LoadTrunk(volume: 250)
audi.StopEngine()
audi.CloseWindows()
audi.CarInfo()

toyota.Description()
toyota.OpenDoor()
toyota.StartEngine()
toyota.LoadTrunk(volume: 140)
toyota.Drive(km: 450)
toyota.Drive(km: 200)
toyota.StopEngine()
toyota.CarInfo()

volvo.Description()
volvo.OpenDoor()
volvo.OpenWindows()
volvo.StartEngine()
volvo.LoadTrunk(goods: 20000)
volvo.Drive(km: 14000)
volvo.Drive(km: 1000)
volvo.TruckInfo()
volvo.StopEngine()
