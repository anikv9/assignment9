import UIKit

var greeting = "Hello, Sandro or Nana!"
//saying hello to you guys:)


//1
protocol Cannons {
    func fireCannon(count: Int)
}

protocol CargoManaging {
    func addCargo(items: [String])
    func removeCargo(items: [String])
    func listCargo() -> [String] //all the methods we have in cargomanager class
}

protocol CrewManaging {
    func addCrew(crewMembers: Int)
    func removeCrew(crewMembers: Int)
    func listCrew() -> Int // same here, putting all the methods of crewmanager class
}


class CargoManager: CargoManaging {
    private var cargo: [String] = [] // i hope writing private here will ensure that this class is only available to crew members

    func addCargo(items: [String]) {
        cargo.append(contentsOf: items)
    }

    func removeCargo(items: [String]) {
        cargo = cargo.filter { !items.contains($0) }
    }

    func listCargo() -> [String] {
        return cargo
    }
}

class CrewManager: CrewManaging {
    private var crew: Int = 0

    func addCrew(crewMembers: Int) {
        crew += crewMembers
    }

    func removeCrew(crewMembers: Int) {
        crew = max(0, crew - crewMembers)
    }

    func listCrew() -> Int {
        return crew
    }
}

class PirateShip: Cannons {
    
    var name: String
    var cannonsCount: Int
    var cargoManager: CargoManager
    var crewManager: CrewManager
    
    init(name: String, cannonsCount: Int) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = CargoManager()
        self.crewManager = CrewManager()
    }
    
    func fireCannon(count: Int) {
        print("\(name) is firing \(count) of its \(cannonsCount) cannons!")
    }
    
    func addCargo(items: [String]) {
        cargoManager.addCargo(items: items)
        print("\(name) added the following items to its cargo: \(items.joined(separator: ", ")).")
    }
    
    func removeCargo(items: [String]) {
            cargoManager.removeCargo(items: items)
            print("\(name) removed the following items from its cargo: \(items.joined(separator: ", ")).")
    }

    func listCargo() -> [String] {
        return cargoManager.listCargo()
    }

        func addCrew(crewMembers: Int) {
            crewManager.addCrew(crewMembers: crewMembers)
            print("Hired \(crewMembers) new crew members. \(name) now has a crew of \(crewManager.listCrew()).")
        }

        func removeCrew(crewMembers: Int) {
            crewManager.removeCrew(crewMembers: crewMembers)
            print("Let go of \(crewMembers) crew members. \(name) now has a crew of \(crewManager.listCrew()).")
        }
    
    func listCrew() -> Int {
            return crewManager.listCrew()
        }
    }


class Frigate: PirateShip {
    
}

class Galleon: PirateShip {
    
}

//2
class TreasureMap {
    private let X: Int
    private let Y: Int

    init(X: Int, Y: Int) {
        self.X = X
        self.Y = Y
    }

    func hintToTreasure(userX: Int, userY: Int) -> String {
        if userX == X && userY == Y {
            return "Hooray! You found the treasure!"
        } else {
            let xDirection = userX < X ? "east" : "west"
            let yDirection = userY < Y ? "north" : "south"
            
            let hint = "You didnt find the treasure. Try heading \(xDirection) and \(yDirection)."
            return hint
        }
    }
}


//3
class SeaAdventure {
    let adventureType: String

    init(adventureType: String) {
        self.adventureType = adventureType
    }

    func encounter() {
        print("Flying Dutchman is coming to you!")
    }
}

//4
class PirateCode {
    private func discussTerms(term: String) {
        print("Let's discuss the terms: \(term)")
    }

    func parley(term: String) {
        discussTerms(term: term)
        print("\(term)")
    }

    func mutiny(term: String) {
        discussTerms(term: term)
        print("\(term)")
    }
}

//5
let cargoManager = CargoManager()
let crewManager = CrewManager()
let pirateShip = PirateShip(name: "great ship name", cannonsCount: 10)

pirateShip.crewManager.addCrew(crewMembers: 20)
pirateShip.cargoManager.addCargo(items: ["treasure1", "treasure2"])

let map = TreasureMap(X: 5, Y: 8)
let pirateCode = PirateCode()
let seaAdventure = SeaAdventure(adventureType: "Flying Dutchman")

print(map.hintToTreasure(userX: 4, userY: 8))
print(map.hintToTreasure(userX: 5, userY: 8))

let adventure: () = seaAdventure.encounter()
print(adventure)

let captainAction = "attack"

if captainAction == "attack" {
    pirateCode.mutiny(term: "Flying Dutchman")
    print("Attack! Load all cannons!")
    pirateShip.fireCannon(count: pirateShip.cannonsCount)
} else {
    pirateCode.parley(term: "Flying Dutchman")
    print("Escape!")
}


//better doing homework late than never:)
