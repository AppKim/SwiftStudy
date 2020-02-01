import UIKit

// Switch

var someNumber = 8

switch someNumber {
case 5...8:
    print("5~8")
case 9...12:
    print("9~12")
case 13..<17:
    print("13~16")
default:
    break
}
