# Zync iOS SDK
www.zync.com

Video Playback SDK for no DRM and FairPlay content. Note that FairPlay content can only be played on a real device.

## **Install ZyncSDK**: 
### Requirements
- Xcode 12.0+
- iOS 14.0+
### Manually

Drag-and-drop the ZyncSDK.xcframework folder into your project. Then select Embed & Sign for ZyncSDK.xcframework in Xcode General tab; Frameworks, Libraries, and Embedded content.

The ZyncSDK relies on the following dependencies which must be added and embedded into your app. The dependencies can be added through a cocaopod install:
```
pod 'SDWebImage'
pod 'lottie-ios'
```

## **Step 2:** Using the Zync SDK Player

#### Swift
```swift
import UIKit
import ZyncSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        let browseViewController = Zync().launchBrowse()
        self.navigationController?.present(browseVC, animated: false, completion: nil)
    }
    
    func playDrm() {
        let streamUrl = URL(string: "https://example-stream.com/drm-fairplay/sampleVideo/master.m3u8")!
        // The FairPlay player only works with Zync content
        let zyncPlayer = Zync().createPlayer(fairplayUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }
    
    func playNonDrm() {
        let streamUrl = URL(string: "https://example-stream.com/non-drm/sampleVideo/master.m3u8")!
        let zyncPlayer = Zync().createPlayer(nonDrmUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }
}
```

## **Step 3:** Build and run
Select _Product > Run_ in the menu bar.

## API

## createZyncPlayer
Creates a Zync player that can play either FairPlay content or non DRM content. If no license key url and FairPlay certificate is provided, the player defaults to the Zync FairPlay license and ceritficate.

### Example - FairPlay
```swift
let zyncPlayer = Zync().createZyncPlayer(fairplayUrl: streamUrl)
show(zyncPlayer, sender: self)
```

### Example - FairPlay with license url and certicate url specified
```swift
let zyncPlayer = Zync().createZyncPlayer(fairplayUrl: streamUrl, licenseUrl: licenseUrl, certificateUrl: certificateUrl)
show(zyncPlayer, sender: self)
```

### Example - Non DRM
```swift
let zyncPlayer = Zync().createZyncPlayer(nonDrmUrl: streamUrl)
show(zyncPlayer, sender: self)
```

## launchBrowse
Launches the Browse Playlist experience
```swift
let browseViewController = Zync().launchBrowse()
self.navigationController?.present(browseVC, animated: false, completion: nil)
```
