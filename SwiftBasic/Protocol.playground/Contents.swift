import UIKit

// Protocols
// 반드시 구현해야하는 요소(프로퍼티)를 가지고있는 클래스

protocol DeskMaterial {
    var top : String {get set}
    var middle : String {get set}
}

protocol DeskSize {
    var width : Int {get set}
    var height : Int {get set}
    func area() -> Int
}

protocol DeskInfo: DeskSize, DeskMaterial{
    
}

/*
class TestClass : DeskInfo{
    var width: Int
    
    var height: Int
    
    func area() -> Int {
        <#code#>
    }
    
    var top: String
    
    var middle: String
    
    
}
struct TestStruct : DeskInfo {
    var width: Int
    
    var height: Int
    
    func area() -> Int {
        <#code#>
    }
    
    var top: String
    
    var middle: String
    
    func <#fields#>
}
*/

class MyClass : DeskSize,DeskMaterial{
    var top: String = ""
    
    var middle: String = ""
    
    var width: Int = 0
    
    var height: Int = 0
    
    func area() -> Int {
        return width * height
    }
}

var myClass = MyClass.init()
myClass.width = 20
myClass.height = 30
myClass.area()
