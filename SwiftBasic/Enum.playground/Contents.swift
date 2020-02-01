import UIKit

// Enumeration

enum CurrentPoint {
    case current
    case near
    case other
}

enum ImageType {
    case none
    case jpg
    case png
    case gif
}

//var imageType = ImageType.none
var imageType : ImageType = .none
imageType = .jpg

if imageType == .none {
    
}else{
    
}

enum MediaType {
    case picture(width : String , height : String)
    case movie(lenth : Int)
}


var media = MediaType.picture(width: "200", height: "300")
//media = .movie(lenth: 50)

switch media {
case .movie(lenth: let length):
    print(length)
case .picture(width: let width, height: let height):
    print(width)
    print(height)
default:
    break
}
