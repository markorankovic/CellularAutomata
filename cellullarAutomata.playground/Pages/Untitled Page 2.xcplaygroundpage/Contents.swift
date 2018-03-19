

//import Foundation
//
//let ruleSet = 90
//
//
//
//infix operator **: DefaultPrecedence
//
//func **(lhs: Int, rhs: Int) -> Int {
//    return Int(pow(Double(lhs), Double(rhs)))
//}
//
//
//func ruleSetToArrayOfBools() -> [Bool] {
//    var bools: [Bool] = []
//    let iterations = Int(log2(Double(ruleSet)))
//    var remaining = ruleSet
//    for i in 0..<iterations+1 {
//        let condition = (2 ** (iterations - i)) <= remaining
//        bools.append(condition)
//        if condition {
//            remaining -= (2 ** (iterations - i))
//        }
//    }
//    return bools
//}
//
//ruleSetToArrayOfBools()


