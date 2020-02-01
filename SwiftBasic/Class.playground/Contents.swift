import UIKit

// Class

class Soccer {
    var homeScore = 0
    var awayScore = 0
    
    func result() -> String {
        return "\(homeScore)" + " : " + "\(awayScore)"
    }
}

class Baseball {
    var homeScore = 0
    var awayScore = 0
    
    func result() -> String {
        return "\(homeScore)" + " : " + "\(awayScore)"
    }
    
}

class Football{
    var homeScore = 0
    var awayScore = 0
    
    func result() -> String {
        return "\(homeScore)" + " : " + "\(awayScore)"
    }
}



class ScoreBoard {
    var homeScore = 0
    var awayScore = 0
    func result() -> String {
        return "\(homeScore)" + " : " + "\(awayScore)"
    }
}

// Inheritance
class Tennis : ScoreBoard{
    
}

class Game : ScoreBoard{
    // Override
    override func result() -> String {
        return "\(homeScore)" + " - " + "\(awayScore)"
    }
    
}

var tennis = Tennis()
tennis.awayScore = 0
tennis.homeScore = 15
tennis.result()

var game = Game()
game.homeScore = 30
game.awayScore = 14
game.result()


// Reference（Classの特徴）

var tennis2 = tennis
tennis2.homeScore = 10
tennis.homeScore

// Value Copy

