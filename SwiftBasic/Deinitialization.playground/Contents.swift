import UIKit

// Deinitialization
// 초기화해제


class Memory {
    
    init() {
        
        print("생성되는 시점에 호출")
    }
    // 팝업
    // 팝업을 내릴때 다른곳에 데이터를 전송할경우
    deinit {
        print("소멸되는 시점에 호출")
    }
    
}

var myMemory : Memory? = Memory()

myMemory = nil


