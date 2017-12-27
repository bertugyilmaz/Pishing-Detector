//
//  Helper.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static func showAlertView(title: String, message: String) -> UIAlertController{
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertView.addAction(okButton)
        return alertView
    }
}
