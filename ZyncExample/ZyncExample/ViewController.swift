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
        let stream = "https://media.stg.zync.tv/drm-fairplay/Nike%20Breaking2%20Trailer.mp4/master.m3u8"
        let streamUrl = URL(string: stream.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        let zyncPlayer = Zync(apiKey: "API KEY GOES HERE").createZyncPlayer(fairplayUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }

    func playNonDrmVideo() {
        let stream = "https://media.stg.zync.tv/drm-none/Nike%20Breaking2%20Trailer.mp4/master.m3u8"
        let streamUrl = URL(string: stream.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        let zyncPlayer = Zync(apiKey: "API KEY GOES HERE").createZyncPlayer(nonDrmUrl: streamUrl)
        show(zyncPlayer, sender: self)
    }
}

