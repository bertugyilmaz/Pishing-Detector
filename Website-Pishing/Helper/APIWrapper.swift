//
//  APIWrapper.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation
import Alamofire

class APIWrapper {
    static let sharedInstance = APIWrapper()
    
    func request(body: Parameters,completion: @escaping (_ result: Bool, _ response: [String: AnyObject]?, _ error: Error?) -> ()){
        Alamofire.request(BASE_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            if let err = response.error {
                completion(false,nil,err)
            }
            
            if let json = response.result.value {
                if let dict = json as? [String: AnyObject] {
                    completion(true, dict,nil)
                }
            }
        }
    }
}
