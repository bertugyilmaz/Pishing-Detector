//
//  MainViewController.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 26.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

