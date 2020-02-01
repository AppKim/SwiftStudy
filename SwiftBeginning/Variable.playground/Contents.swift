//変数について

var radious = 3.123
let p = 3.1415926535

radious * radious * p

radious = 5.456

func circleArea(r: Double) -> Double {
    return r * r * 3.14
}

circleArea(r: 3.123)
circleArea(r: 5.456)
circleArea(r: 8.97)

class Circle {
    //var radious = 3.123
    var radious : Double
    let p = 3.14
    
    init(){
        radious = 3.123
    }
    init(radious : Double){
        self.radious=radious
    }
    
    func area() -> Double{
        return radious*radious*p
    }
  
}

//let circle = Circle.init()
let circleNotInit = Circle()
let circle = Circle(radious: 6)

circleNotInit.area()
circle.area()

var weight = Int(65)
var message = String("Hello")

var evenNumbers = [Int](arrayLiteral: 1,2,3,4)
//var oddNumber = Array<Int>.init()
var oddNumbers = Array<Int>()






    
