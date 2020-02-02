import UIKit

// Functinon（関数）は一つの機能

// Parameterは関数のオプション値
func sum(inputNumber_1 number_1:Int,inputNumber_2 number_2:Int) -> Int{
    
    return number_1 + number_2
    
}

// Argumentは関数の呼び出す際に利用できるオプション値
var result = sum(inputNumber_1: 5, inputNumber_2: 5)

print(result)


func sum2(number_1:Int,number_2:Int) -> Int{
    
    return number_1 + number_2
    
}

print(sum2(number_1: 5, number_2: 10))


func sum3(_ num1:Int,_ num2:Int) -> Int{
    return num1 + num2
}

print(sum3(50, 23))



func sumAll(numbers: Int...) -> Int{
    
    var total = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

sumAll(numbers: 1,2,3,4,5)

func sumAlls(_ num1:Int,_ num2:Int) -> (Int,Int,result:Int){
    
    return (num1,num2,num1+num2)
}

var mySum = sumAlls(20, 30)
print(mySum.result)
