import UIKit

// Closures

func sayHi(name : String) -> String{
    return "\(name)Hello"
}

var sayGreat = { (name : String) -> String in
    return "Hello \(name) Great"
    
}

// Type Inference : return typeを推測 (타입 추론)
var sayGreat2 = { (firstName : String,lastName : String) in
    return "\(firstName+lastName) Hello"
}

// Implicit Returns from Single-express closure (암시적 리턴(반환) - 한줄일떄만)
var sayGreat3 = { (firstName : String,lastName : String) in
    "\(firstName+lastName) Hello"
}

var sayGreat4 : (String,String) -> String = { (firstName ,lastName) in
    "\(firstName+lastName) Hello"
}

// Shortand Arguments Names (인자 이름 축약)
var sayGreat5 : (String,String) -> String = { $0 + $1}

sayHi(name: "jin")
sayGreat("jin")
sayGreat2("kim","lee")
sayGreat3("park","chun")
sayGreat4("park","chun")
sayGreat5("park","chun")
