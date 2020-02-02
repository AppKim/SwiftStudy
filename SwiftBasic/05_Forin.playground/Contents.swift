import UIKit

// For in Loops

// Array
var names = ["john","lee","kim","brian"]
var age = [5,6,2,7,5]

for elementName in names {
    print("Name : \(elementName)")
}
for elementAge in age {
    print("Age : \(elementAge)")
}

// Dictionary
var people = ["john" : 5 ,"kim" : 20 , "Lee" : 13]

for elementPeople in people {
    print("Name : \(elementPeople.key)")
    print("Age : \(elementPeople.value)")
}

for Index in 0..<people.count {
    print(Index)
}

print("reversed")

for Index in (0..<people.count).reversed(){
    print(Index)
}

