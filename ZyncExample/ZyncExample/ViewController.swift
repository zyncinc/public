//
//  ViewController.swift
//  ZyncExample
//

import UIKit
import ZyncSDK


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let browseVC = Zync().launchBrowse()
        self.navigationController?.present(browseVC, animated: false, completion: nil)
    }
}

