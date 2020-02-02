import UIKit

// Properties 프로퍼티

// Stored Properties 저장 프로퍼티
// Computed Properties 계산 프로퍼티

class SomeClass { // 참조: 상속받은곳에서 값을 바꿀경우 전부 값이 바뀐다
    var firstScore = 10 // Stored Properties
    var secondScore = 10  // Stored Properties≈
    var totalScore : Int { // Computed Properties
        get{
            return firstScore + secondScore
        }
    }
}

var someClass = SomeClass()
someClass.firstScore = 50
someClass.secondScore = 100
someClass.totalScore


struct SomeStruct { // 복사
    var firstScore = 10
    var secondScore = 10
    var totalScore : Int {
        get{
            return firstScore + secondScore
        }
    }

}

var someStruct = SomeStruct()
someStruct.firstScore = 50
someStruct.secondScore = 100
someStruct.totalScore

// enum → Stored Properties✖︎
// enum → Computed Properties○
enum SomeEnum {
    case iPhone
    case iPad
    
    /*
    var price: Int{
        return 30
    }
    */
    
    var price : Int {
        switch self {
        case .iPad:
            return 500
        case .iPhone:
            return 1000
        }
    }
    
}

var someEnum = SomeEnum.iPad
someEnum.price

someEnum = .iPad
someEnum = .iPhone

