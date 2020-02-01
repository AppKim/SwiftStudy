func hello (name : String) -> String {
    return "Hello" + name
}

let message = hello(name: "Jain")

print("HI~~~")
print("Hello")
print(message)

func addTwoNumbers(num1 : Int,num2 : Int = 100) -> Int {
    let sum = num1 + num2
    return sum
}

addTwoNumbers(num1: 20, num2: 30)
addTwoNumbers(num1: 20)

func noReturn() -> Void {
        
}

func addNumbers(numbers : Int ...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1,2,3,4,5,6)

func myInfo() -> (name : String , weight : Int){
    return ("KIM",68)
}

let info = myInfo()
print(info)
print(info.name)


//printFunction

print("test1","test2","test3",1,2,3,4,55.5,separator : "--" , terminator : "")

//ArgumentLabel

func calculate(mutiflyFirstNumber num1 : Int , bySecondNumber num2 : Int) -> Int {
    return num1 * num2
}

func calculate(_ num1 : Int , _ num2 : Int) -> Int {
    return num1 * num2
}

calculate(10, 20)
calculate(mutiflyFirstNumber: 30, bySecondNumber: 40)

//CallByValue,CallByReference

func addTwoNumber(num1 : Int, num2 : inout Int) -> Int{
    num2 = 7
    return num1+num2
}

var test1 = 1
var test2 = 2

//CallByReference-> %test2

addTwoNumber(num1: test1, num2: &test2)
