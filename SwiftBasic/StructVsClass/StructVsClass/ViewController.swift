//
//  ViewController.swift
//  StructVsClass
//
//  Created by 김준석 on 2020/02/02.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// Class 보다 Struct가 생성속도가 더빠르기때문에 모델은 Struct 형태로 만들어서 사용하는게 퍼포먼스가 좋음
// **주의사항 값을 참조해서 사용해야 하는 경우는 Struct사용불가 Struct는 값을 복사해서 쓰기때문에 참조형이아님

struct TestStruct {
    var name : String
    var age : Int
    init(name: String , age: Int) {
        self.name = name
        self.age = age
    }
}

class TestClass {
    var name : String
    var age : Int
    init(name: String , age: Int) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testStruct : [TestStruct] = []
        var testClass : [TestClass] = []
        
        var str = TestStruct(name: "aa", age: 0)
        var str2 = str
        str2.name = "bb"
        
        print("str\(str)")
        print("str2\(str2)")
        
        var str3 = TestClass(name: "aa", age: 0)
        var str4 = str3
        str4.name = "cc"
        
        print("str3\(str3.name)")
        print("srt4\(str4.name)")
        
        let startTime = CFAbsoluteTimeGetCurrent()
        for _ in 0..<10000000{
            testStruct.append(TestStruct.init(name: "aa", age: 0))
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
    
        let startTime2 = CFAbsoluteTimeGetCurrent()
        for _ in 0..<10000000{
            testClass.append(TestClass.init(name: "aa", age: 0))
        }
        let durationTime2 = CFAbsoluteTimeGetCurrent() - startTime
        
        print("durationTime Struct : \(durationTime)")
        print("durationTime Class : \(durationTime2)")
        
    }


}

