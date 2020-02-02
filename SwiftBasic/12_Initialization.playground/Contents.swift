import UIKit

// Initialization
// 초기화

class Score {
    var homeTeamSocre : Int?
    var awayTeamSocre : Int?
    
    func totalScore() -> Int {
        return homeTeamSocre! + awayTeamSocre!
    }
    /*
    프로퍼티(변수,상수)에 값을선언하지않을경우에 값초기화 필요
    init() {
        homeTeamSocre = 5
        awayTeamSocre = 10
    }
    */
}

struct ScoreStruct {
    var homeTeamSocre : Int
    var awayTeamSocre : Int
    
    func totalScore() -> Int {
        return homeTeamSocre + awayTeamSocre
    }
    init() {
        homeTeamSocre = 0
        awayTeamSocre = 0
    }
}

// 인스턴스 생성
var sss = ScoreStruct()
sss.awayTeamSocre
sss.homeTeamSocre

