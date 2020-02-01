import UIKit

// Generic
// 동적인타입설정가능
// 動的タイプ設定可能

var intValue : Int = 5
var doubleValue : Double = 5.6
var floatValue : Float = 3.4

func sum(a: Double, b:Double) -> Double {
    return a+b
}

sum(a: doubleValue, b: doubleValue)

func sumGenetic<T: Numeric>(a: T, b: T) -> T {
    return a+b
}

var resultInt = sumGenetic(a: intValue, b: intValue)
var resultDouble = sumGenetic(a: doubleValue, b: doubleValue)
var resultFloat = sumGenetic(a: floatValue, b: floatValue)
resultInt
resultDouble
resultFloat
