//
//  APIWrapper.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class APIWrapper {
    static let sharedInstance = APIWrapper()
    
    func request(body: Parameters,completion: @escaping (_ result: Bool, _ response: [String: AnyObject]?) -> ()){
        Alamofire.request(BASE_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            
            if let json = response.result.value {
                if let dict = json as? [String: AnyObject] {
                    if let result = dict["Results"] as? [String: AnyObject]{
                        completion(true, result)
                    }else {
                        if let error = dict["error"] as? [String:AnyObject]{
                            Helper.showAlertView(title:"" , message: error["message"] as! String)
                            completion(false,nil)
                        }
                    }
                }
            }
        }
    }
}
