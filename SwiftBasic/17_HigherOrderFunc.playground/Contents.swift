import UIKit

// Higher Order Function

// map

var numberArray = [2, 3, 6, 4, 1]
let mapped = numberArray.map{ $0 * 10}
print(mapped)

let stringArray = ["lee", "june", "kim"]
let mappedString = stringArray.map{ $0.uppercased()}
print(mappedString)

// compact map

let someArray : [Any] = [2, 3, 4, "kim", "jin"]
let compactMapped = someArray.compactMap{ $0 as? Int}
let Mapped = someArray.map{ $0 as? Int}
print(compactMapped)
print(Mapped)

// filter

let overInt = numberArray.filter{ $0 > 3}
let overString = stringArray.filter{ $0.count == 3}

print(overInt)
print(overString)

// reduce

/*
let reduceResult = numberArray.reduce(0) { (value1, value2) -> Int in
    value1 + value2
}
 */

// let reduceResult = numberArray.reduce(0, { $0 + $1 }

let reduceResultInt = numberArray.reduce(50) { $0 + $1 }
print(reduceResultInt)

let reduceResultString = stringArray.reduce("aaa") { $0 + $1 }
print(reduceResultString)

// sort

//numberArray.sort(by: <)
//print(numberArray)

// sorted 값을 일시적으로만 정렬하고싶을때

let sorted = numberArray.sorted()
print(sorted)
print(numberArray)
