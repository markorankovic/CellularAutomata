

//: # An algorithm for Stephen Wolfram's Two-dimensional elementary cellular automata
//: ## Written by Marko Rankovic

import Foundation


let ruleSet: UInt8 = 54
let generations = 2

var grid: [[Bool]] = []


func applyState(_ state: Bool, _ cellLoc: (Int, Int)) {
    grid[cellLoc.0][cellLoc.1] = state
}

func initialize() {
    for _ in 0..<generations {
        grid.append(createColumn())
    }
    applyState(true, (0, generations / 2))
}

func createColumn() -> [Bool] {
    var column: [Bool] = []
    for _ in 0..<generations {
        column.append(false)
    }
    return column
}

func getCell(_ cellLoc: (Int, Int)) -> Bool {
    // Error prone if called before initialization
    if cellLoc.0 < 0 || cellLoc.0 >= generations || cellLoc.1 < 0 || cellLoc.1 >= generations   {
        return false
    }
    return grid[cellLoc.0][cellLoc.1]
}

func getNeighborhood(_ cellLoc: (Int, Int)) -> [Bool] {
    return [getCell((cellLoc.0 - 1, cellLoc.1 - 1)), getCell((cellLoc.0 - 1, cellLoc.1)), getCell((cellLoc.0 - 1, cellLoc.1 + 1))]
}

infix operator **: DefaultPrecedence

func **(lhs: Int, rhs: Int) -> Int {
    return Int(pow(Double(lhs), Double(rhs)))
}

func ruleSetToArrayOfBools() -> [Bool] {
    var bools: [Bool] = []
    let iterations = 8
    var remaining = Int(ruleSet)
    for i in 1..<iterations+1 {
        let condition = (2 ** (iterations - i)) <= remaining
        bools.append(condition)
        if condition {
            remaining -= (2 ** (iterations - i))
        }
    }
    return bools
}

let rule = ruleSetToArrayOfBools()

func calculateState(_ neighorhood: [Bool]) -> Bool {
    // Posibilities: TTT, TTF, TFT, TFF, FTT, FTF, FFT, FFF
    // Rule:          F    F    T    T    F    F    F    F
    
    let ruleIndex = Int(neighorhood.enumerated().map{ $1 ? (2 ** $0) : 0 }.reduce(0, +))
    
    return rule[ruleIndex]
    
}

initialize()

for row in 1..<generations {

    for col in 0..<generations {
        let loc = (row, col)
        let neighbourHood = getNeighborhood(loc)
        let state = calculateState(neighbourHood)
        applyState(state, loc)
    }

}


var string = ""

for r in grid {
    for c in r {
        string += c ? "• " : "  "
    }
    string += "\n"
}

print(string)


