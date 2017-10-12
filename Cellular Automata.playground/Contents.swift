import Marko

public extension Int {
    public func times(f:()->()) {
        for _ in 1...self {
            f()
        }
    }
}

func print(bools: [Bool]) { // Prints the bools in characters
    println(String(bools.map { $0 ? "•" : " " }))
}

func toInt(bools: [Bool]) -> Int { // Changes the bools to binary code
    var x = 0
    for (i, b) in enumerate(reverse(bools)) {
        x += b ? 1 << i : 0
    }
    return x
}

func isBit1(x: Int, #at: Int) -> Bool { // Checks if the bit is 1 at a part of the binary version of a given number
    return x & 1 << at > 0
}

func next(state: [Bool], #rule: Int) -> [Bool] { // Produces a new state relative to the current state
    var a: [Bool] = []
    a.reserveCapacity(state.count)
    for triple in wrapSlide(state, by: 3, anchor: 1) {
        let bool = isBit1(rule, at: toInt(triple)) /* implement this! */
        a.append(bool)
    }
    return a
}

var state = Array(count: 31, repeatedValue: false) // Creates the initial line of states
state[state.count / 2] = true // In the middle the state will be true
print(state)
50.times {
    state = next(state, rule: 110)
    print(state)
}










