import UIKit

// Array

// Index out of range -> Crash
var someStrings = [String]()
someStrings.append("a")
someStrings.append("b")
someStrings.append("c")

someStrings.remove(at: 1)

var removeIndex = 2

if someStrings.count-1 >= removeIndex {
    someStrings.remove(at: removeIndex)
}

print(someStrings)

// Set
// hashable

var strings1 = Set<String>()
var strings2 = Set<String>()

strings1.insert("A")
strings1.insert("B")
strings1.insert("C")
strings1.insert("D")

strings1.remove("D")

strings2.insert("E")
strings2.insert("F")
strings2.insert("G")
strings2.insert("A")

print(strings1)

let union = strings1.union(strings2)

print(union)

let inter = strings1.intersection(strings2)

print(inter)

let symm = strings1.symmetricDifference(strings2)

print(symm)

let sub = strings1.subtracting(strings2)

print(sub)


// Dictionary
// Key : Value
var sports = [String : Any]()

sports["soccer"] = "Korea"
sports["baseball"] = 1
sports["football"] = true

print(sports)

print(sports["football"])

if let hasSports = sports["football"]{
    print(hasSports)
}
