import UIKit

// Optional Type
// Expression : ?

var myString1 : String? //Optional

myString1 = nil

var myString2 : String = String.init() //Non-Optional

// Networkよりデータを受け取る際

// 試験
// - 0 (全部ハズレ) -F
// - 未実施 -E

var myScore : Int?
myScore = 0

if myScore == nil {
    print("E")
}

// 値が必ずあると仮説する方式
//　Force Unwrapping
else if myScore! < 60 {
    print("F")
}

// Unwraping(Optionalを外す）
// Force Unwrapping(強制) - 値!

var myTestScore : Int?

myTestScore = 50

if myTestScore == nil{
    print("nil")
}else if myTestScore! < 100 {
    print("has score")
}

// Optional Binding

if let hasScore = myTestScore{
    if hasScore < 60 {
        print("myTestScore : \(hasScore)")
    }
}else{
     print("myScore : nil")
}

// Optional Chaining

class People {
    var score : Score?
}

class Score {
    var testName : String?
}

var people : People? = People()

if let hasName = people?.score?.testName{
    if hasName == "Park"{
        
    }
}

// Nil Coalescing Operator
// Nil 併合演算子

var myNmae : String?
var scoreTest : Int?

if scoreTest ?? 0 < 50 {
    print("number")
}
print(myNmae ?? "Jin")

