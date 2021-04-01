//
//  ViewController.swift
//  ZyncExample
//
//

import UIKit
import ZyncSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let zyncSDK = Zync(apiKey: "API KEY GOES HERE")
        let browseVC = zyncSDK.launchBrowse()
        self.navigationController?.present(browseVC, animated: false, completion: nil)
    }

    func playDrmVideo() {
        let stream = "https://media.app.zync.tv/drm-fairplay/Soul.%20Featuring%20the%20new%20Porsche%20Taycan.%20.mp4/master.m3u8"
        let streamUrl = URL(string: stream.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        let zyncPlayer = Zync(apiKey: "API KEY GOES HERE").createZyncPlayer(fairplayUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }

    func playNonDrmVideo() {
        let stream = "https://media.app.zync.tv/drm-none/Formula%201_%20Drive%20to%20Survive%20_%20Official%20Trailer%20%5BHD%5D%20_%20Netflix.mp4/master.m3u8"
        let streamUrl = URL(string: stream.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        let zyncPlayer = Zync(apiKey: "API KEY GOES HERE").createZyncPlayer(nonDrmUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }
}

