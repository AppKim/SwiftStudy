import UIKit

// Extension
// 기존에 존재하는 클래스에 처리를 추가하고싶을때 (기능추가)
// 既存のものに処理を付け足す

// 색깔지정
// 메인컬러 -
// 서브컬러 -
// 텍스트 메인 타이틀 -
// 텍스트 상세 -
extension UIColor {
    var mainRedColor : UIColor {
        return UIColor(red: 240/255, green: 30/255, blue: 30/255, alpha: 1)
    }
    var subGreenColor : UIColor{
        return UIColor(red: 50/255, green: 250/255, blue: 30/255, alpha: 1)
    }
    
}

var titleColor : UIColor!
var descriptionColor : UIColor!

titleColor = UIColor(red: 240/255, green: 30/255, blue: 30/255, alpha: 1)
descriptionColor = UIColor(red: 50/255, green: 250/255, blue: 30/255, alpha: 1)

titleColor = UIColor().mainRedColor
descriptionColor = UIColor().subGreenColor

