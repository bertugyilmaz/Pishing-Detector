//
//  Extension+UIAplication.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 20.01.2018.
//  Copyright © 2018 Bertuğ Yılmaz. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}

