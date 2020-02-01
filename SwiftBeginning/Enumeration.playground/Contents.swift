//列挙、数えあげる

enum AppleOS: String{
    case iOS = "iPad"
    case macOS
    case tvOS
    case watchOS
}

var osType : AppleOS = .iOS
print(osType.rawValue)

func printAppleDevice(osType: AppleOS){
    switch osType {
    case .iOS:
        print("iPhone")
    case .macOS:
        print("iMac")
    case .tvOS:
        print("Apple TV")
    case .watchOS:
        print("Apple Watch")
    }
}

printAppleDevice(osType: .iOS)

