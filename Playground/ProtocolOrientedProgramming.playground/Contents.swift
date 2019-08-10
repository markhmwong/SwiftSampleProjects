import UIKit

protocol Initializable {
    init()
}

extension Initializable {
    
    func alcoholicPercentage() {
        print("5%")
    }
    
}

struct PaleAle: Initializable {
    
}

class Beer <BeerType: Initializable> {
    func beerType() -> BeerType {
        return BeerType()
    }
}

class Furphy: Beer<PaleAle> {
    
}

let furphy = Furphy()
furphy.beerType()
furphy.beerType().alcoholicPercentage()
