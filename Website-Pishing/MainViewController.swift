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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButton.addTarget(self, action: #selector(startButtonAction(sender:)), for: .touchUpInside)
    }
    
    @objc func startButtonAction(sender: UIButton){
        let test = DataModel(sfh: "1", popUp: "1", ssl: "0", request: "-1", urlAnchor: "0", traffic: "-1", urlLength: "-1", age: "1", havingIP: "1")
        APIWrapper.sharedInstance.request(body: test.convertToDictionary()) { (result, response, error) in
            if error != nil{
                print(error!)
                return
            }
            
            if result {
                print(response!)
            }
        }
    }

    func requestWithSession(){
        do {
            let test = DataModel(sfh: "1", popUp: "1", ssl: "0", request: "-1", urlAnchor: "0", traffic: "-1", urlLength: "-1", age: "1", havingIP: "1")
            
            let jsonData = try JSONSerialization.data(withJSONObject: test.convertToDictionary(), options: .prettyPrinted)
            let base64Encoded = jsonData.base64EncodedData(options: .init(rawValue: 0))
            let request = NSMutableURLRequest(url: NSURL(string: BASE_URL)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = HEADERS
            request.httpBody = base64Encoded as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                }
            })
            
            dataTask.resume()
           
        } catch {
            print(error.localizedDescription)
        }
    }

}
