import UIKit

/*

 TypeAlias
 ：データタイプを変数のように変化することができる
 ：既存のデータタイプを組み合わせし、新しいデータタイプを作成することができる
 
 */

typealias SimpleRate = UInt8

var typeTest : SimpleRate = 255

typealias GridPoint = (x:Int,y:Int)

var touchPoint : GridPoint = GridPoint(10,20)

print(touchPoint)
print(touchPoint.x)

