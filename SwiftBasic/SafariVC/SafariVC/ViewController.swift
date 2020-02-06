//
//  ViewController.swift
//  SafariVC
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://google.com")!)
        self.show(vc
            , sender: self)
    }
    
}

