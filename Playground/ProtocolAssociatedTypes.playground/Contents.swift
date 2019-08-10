import UIKit

protocol InstrumentProtocol {
    var type: String { get set }
}

class Instrument: InstrumentProtocol {
    var type: String = "Piano"
}

let piano = Instrument()
piano.type

protocol InstrumentGenericProtocol {
    associatedtype typeTwo
    var anyType: typeTwo { get set }
}

protocol InstrumentWoodwind {
    func windInstrument()
}

//define explicitly
class InstrumentGeneric: InstrumentGenericProtocol {
    typealias typeTwo = Int
    var anyType: typeTwo = 3
    
}
let guitar = InstrumentGeneric()
guitar.anyType

extension InstrumentGenericProtocol {
    func strings() {
        print("6")
    }
}

guitar.strings()

class Animal {
    
    func talk() {
        print("Bark")
    }
    
}

let dog = Animal()
dog.talk()

class Dog: Animal {
    
}
let rescue = Dog()
rescue.talk()

protocol AnimalTalk {
    func talk()
}

class Cat: AnimalTalk {
    func talk() {
        print("Meow")
    }
}

let cat = Cat()
cat.talk()

//Protocol Delegation
protocol FishDelegate {
    func swimSpeed() -> Int
}

class GoldFish {
    var fishDelegate: FishDelegate
    init(delegate: FishDelegate) {
        self.fishDelegate = delegate
    }
}

class Shark: FishDelegate {
    var attackStrength: Int = 100
    
    func swimSpeed() -> Int {
        return 50
    }
}

let shark = Shark()

var goldFish = GoldFish(delegate: shark)

goldFish.fishDelegate.swimSpeed()


