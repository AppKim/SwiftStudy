/*
 
 Class,StructureのCommon
 1.Property定義
 2.Method定義
 3.コンストラクターを通して初期設定
 4.extension,protocol使用可能
 
 Class
 1.Inheritance
 2.Type Casting
 3.デストラクタを通したリソース整理
 4.ReferenceType
 
 一般的にStructureを選ぶ基準
 1.データのCapsule化
 2.値の割当及び伝達時、コピーすることが合理的の場合
 3.全てのPropertyがあ値型の場合
 4.Inheritance（相続、受け継ぐ）が不要の場合
 
*/

//SuperClass
class NoteBook {
    
    var name = ""
    
    func turnOn(){
        print("Booting...")
    }
}

//SubClass
class MacBook : NoteBook{
    
    var hasTouchBar = true
    var masOsVersion = "10.13"
    
    override func turnOn() {
        super.turnOn()
        print("\(name)'s current macOSVersion is \(masOsVersion)")
        print(name+"'s current macOSVersion is "+masOsVersion)
    }
    
    func tunrOnTouchBar(){
        
    }
}

let macBook = MacBook()
macBook.name = "MacBook Pro"
macBook.turnOn()

//3.デストラクタを通したリソース整理

class Test {
    var exam = ""
    
    init(){
        print("Initializer Called")
    }
    
    deinit {
        print("Deinitializer Called")

    }

}

if true{
    var test = Test()
}



internal class MacBook_Internal : NoteBook{
    
    var hasTouchBar = true
    var masOsVersion = "10.13"
    
    override func turnOn() {
        super.turnOn()
        print("\(name)'s current macOSVersion is \(masOsVersion)")
        print(name+"'s current macOSVersion is "+masOsVersion)
    }
    
    func tunrOnTouchBar(){
        
    }
}

private class MacBook_Private : NoteBook{
    
    var hasTouchBar = true
    var masOsVersion = "10.13"
    
    override func turnOn() {
        super.turnOn()
        print("\(name)'s current macOSVersion is \(masOsVersion)")
        print(name+"'s current macOSVersion is "+masOsVersion)
    }
    
    func tunrOnTouchBar(){
        
    }
}

MacBook_Private()
MacBook_Internal()
