import UIKit

// Closure + func

func greeting(name: String) -> String{
    return "hi\(name)"
}

greeting(name: "jin")

func greetingClosure(name : String) -> () -> String{
    return {"hi"+name}
}

greetingClosure(name: "minho")()

// Closure Expert

var names = ["apple","lemon","brown","red","band","candy","air"]

func filterString(datas: [String],firstString: String) -> [String]{
    var newDatas = [String].init()
    for index in 0..<datas.count{
        if datas[index].first?.description == firstString{
            newDatas.append(datas[index])
        }
    }
    return newDatas
}

filterString(datas: names, firstString: "a")

func filterStringClosure(datas : [String], closure: (String) -> Bool) -> [String]{
    var newDatas = [String].init()
    for data in datas{
        if closure(data) == true {
            newDatas.append(data)
        }
    }
    
    return newDatas
}

filterStringClosure(datas: names) { (element) -> Bool in
    if element.first?.description == "a"{
        return true
    }
    return false
}

var findA : (String) -> Bool = { element in
    if element.first?.description == "a"{
        return true
    }
    return false
}

var findB : (String) -> Bool = { element in
    if element.first?.description == "b"{
        return true
    }
    return false
}

var findC = { (element : String) -> Bool in
    if element.first?.description == "c"{
        return true
    }
    return false
}

var stringLenth5 : (String) -> Bool = { element in
    if element.count == 5{
        return true
    }
    return false
}



filterStringClosure(datas: names, closure: findA)
filterStringClosure(datas: names, closure: findB)
filterStringClosure(datas: names, closure: findC)
filterStringClosure(datas: names, closure: stringLenth5)
