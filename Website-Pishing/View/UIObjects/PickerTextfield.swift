//
//  PickerTextfield.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation
import UIKit

class PickerTextfield: UITextField {
    
    var selectorPicker: UIPickerView!
    var toolBarPicker: UIToolbar!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createPicker()
        createToolbar()

        self.inputView = selectorPicker
        self.inputAccessoryView = toolBarPicker
        
    }
    
    func createPicker() {
        self.selectorPicker = UIPickerView()
        selectorPicker.backgroundColor = .white
        selectorPicker.showsSelectionIndicator = true
    }
    
    func createToolbar() -> UIToolbar {
        //Settings
        toolBarPicker = UIToolbar()
        //toolBarPicker.barStyle = UIBarStyle.BlackTranslucent
        //toolBarPicker.translucent = true
        //toolBarPicker.barTintColor = UIColor.blackColor()
        toolBarPicker.sizeToFit()
        
        //Buttons
        let doneButton = UIBarButtonItem(title: "Tamam", style: UIBarButtonItemStyle.plain, target: self, action:  #selector(PickerTextfield.donePicker))
        doneButton.tintColor = UIColor(red:0.08, green:0.21, blue:0.32, alpha:1.0)
        let spaceTicketButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //        let cancelButton = UIBarButtonItem(title: "Kapat", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PickerTextField.donePicker))
        //        cancelButton.tintColor = UIColor(red:0.08, green:0.21, blue:0.32, alpha:1.0)
        //Assign
        toolBarPicker.setItems([spaceTicketButton, doneButton], animated: false)
        toolBarPicker.isUserInteractionEnabled = true
        return toolBarPicker
    }
    
    @objc func donePicker(_ sender: UIBarButtonItem) -> Bool {
        NotificationCenter.default.post(name: Notification.Name(NOTIFICATION_OK_CLICK), object: nil)
        self.resignFirstResponder()
        return true
    }
}
