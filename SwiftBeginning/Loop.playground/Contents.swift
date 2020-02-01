for i in 1 ... 10 {
    print(i)
}

for i in stride(from: 1, to: 10, by: 2){
    print(i)
}

for i in stride(from: 10, to: 0, by: -1){
    print(i)
}

// command + [ , command + ] 들여쓰기 , control + l 자동맞춤

for i in 2 ... 9 {
    print("\(i)단시작")
    for j in 1 ... 9 {
        print("\(i)*\(j)=\(i*j)")
    }
}

var i = 0
while i < 10 {
    i += 1
    print(i)
}

i = 0
repeat{
     i += 1
    print(i)
}while i < 10
