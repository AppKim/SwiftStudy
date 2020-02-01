let month = 3
let toDo = "Travel"

var toDoArray : Array<String> = ["Travel","work","call"]
var evenNumber : [Int] = [2,4,6,8,10]

toDoArray[0] = "Tsutaya"
toDoArray[1]
toDoArray[2]

evenNumber.append(12)
evenNumber.insert(14, at: 6)
evenNumber.remove(at: 6)
print(evenNumber)

for toDo in toDoArray{
    print(toDo)
}


let myArray = ["a","b","c","d"]

for x in 0..<myArray.count {
    
    print("Value : \(myArray[x])","Index : \(x)")
    
}


for myValue in myArray[0...]{
    
    print("Value : \(myValue)")

}

for myValue_ in myArray[...1]{
    
    print("Value_ : \(myValue_)")
}


