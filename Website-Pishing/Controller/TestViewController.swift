//
//  TestViewController.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var data: DataModel = DataModel()
    var index: Int!
    var selected: Int!
    let cellArr = ["Server From Handler",
                   "Pop-Up Window",
                   "SSL Final State",
                   "Request URL",
                   "URL of Anchor",
                   "Web traffic",
                   "URL Length",
                   "age of domain",
                   "having IP Address"]

    let pickerArr: [[String]] = [["YES","NO","MAYBE"],["YES","NO"],["YES","MAYBE"]]
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.finishButton.addTarget(self, action: #selector(finishButtonAction(sender:)), for: .touchUpInside)
    }
    
   @objc func finishButtonAction(sender: UIButton){
        let parameters = self.data.exportParameters()
        print(parameters)
  
        APIWrapper.sharedInstance.request(body: parameters) { (result, response, err) in
            if err != nil{
                print(err!)
                return
            }
            
            if result {
                print(response!)
                if let result = response!["Results"] as? [String: AnyObject]{
                    for i in result.values {
                        if let arr = i as? NSArray {
                            if let dict = arr[0] as? [String: AnyObject] {
                                print(dict["Scored Labels"])
                                print(dict["Scored Probabilities"])
                                
                                self.present(Helper.showAlertView(title:"Scored Label: \(dict["Scored Labels"] as! String)" , message: "Scored Probabilities: \(dict["Scored Probabilities"] as! String)"), animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }
    }

}
extension TestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PickerTableViewCell
        let text = cellArr[indexPath.row]
        cell.pickerTextField.selectorPicker.dataSource = self
        cell.pickerTextField.selectorPicker.delegate = self
        cell.pickerTextField.tag = indexPath.row
        cell.pickerTextField.delegate = self
        
        cell.pickerTextField.placeholder = text
        return cell
    }
}

extension TestViewController: UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.selected = textField.tag
        if textField.tag == 7 {
            self.index = 1
        }else if textField.tag == 8 {
            self.index = 2
        }else {
            self.index = 0
        }
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArr[self.index].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let arr = self.pickerArr[self.index][row]
        return arr
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var values = ""
        
        if row == 0 {
            values = YES
        }else if row == 1 {
            values = NO
        }else {
            values = MAYBE
        }
        
        switch self.selected {
        case 0:
            print(values)
           data.sfh = values
        case 1:
            data.popUpWindow = values
        case 2:
            data.sslFinalState = values
        case 3:
            data.request_url = values
        case 4:
            data.urlOfAnchor = values
        case 5:
            data.webTraffic = values
        case 6:
            data.urlLength = values
        case 7:
            data.ageOfDomain = values
        case 8:
            data.havingIpAdress = values
        default:
            print("something went wrong")
        }
    }
}
