//
//  DataModel.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation
import Alamofire

class DataModel{
    private var SFH: String!
    private var PopUpWindow: String!
    private var SSLfinal_State: String!
    private var Request_URL: String!
    private var URL_of_Anchor: String!
    private var web_traffic: String!
    private var URL_Length: String!
    private var age_of_domain: String!
    private var having_IP_Address: String!
    
//    init(sfh: String, popUp: String, ssl: String, request: String, urlAnchor: String, traffic: String, urlLength: String, age: String, havingIP: String ) {
//        self.SFH = sfh
//        self.PopUpWindow = popUp
//        self.SSLfinal_State = ssl
//        self.Request_URL = request
//        self.URL_of_Anchor = urlAnchor
//        self.web_traffic = traffic
//        self.URL_Length = urlLength
//        self.age_of_domain = age
//        self.having_IP_Address = havingIP
//    }
    
    var sfh: String! {
        get{
            return SFH
        }set{
            return SFH = String(newValue)
        }
    }
    var popUpWindow: String {
        get{
            return PopUpWindow
        }set{
            return PopUpWindow = newValue
        }
    }
    var sslFinalState: String {
        get{
            return SSLfinal_State
        }set{
            return SSLfinal_State = newValue
        }
    }
    var request_url: String {
        get{
            return Request_URL
        }set{
            return Request_URL = newValue
        }
    }
    var urlOfAnchor: String {
        get{
            return URL_of_Anchor
        }set{
            return URL_of_Anchor = newValue
        }
    }
    var webTraffic: String {
        get{
            return web_traffic
        }set{
            return web_traffic = newValue
        }
    }
    var urlLength: String {
        get{
            return URL_Length
        }set{
            return URL_Length = newValue
        }
    }
    var ageOfDomain: String {
        get{
            return age_of_domain
        }set{
            return self.age_of_domain = newValue
        }
    }
    var havingIpAdress: String! {
        get{
            return having_IP_Address
        }set{
            return self.having_IP_Address = newValue
        }
    }
    
    func exportParameters()-> Parameters {
        var input2 = Dictionary<String,String>()
        
        input2 = [
            "SFH": self.SFH ?? "",
            "popUpWindow": PopUpWindow ?? "",
            "SSLfinal_State": SSLfinal_State ?? "",
            "Request_URL": Request_URL ?? "",
            "URL_of_Anchor": URL_of_Anchor ?? "",
            "web_traffic": web_traffic ?? "",
            "URL_Length": URL_Length ?? "",
            "age_of_domain": age_of_domain ?? "",
            "having_IP_Address": having_IP_Address ?? ""
        ]
        
        var arr = [input2]
        
        var input1 = Dictionary<String,Array<Dictionary<String,String>>>()
        input1 = [
           "input1": arr
        ]

        let dict:Parameters = [
            "Inputs": input1,
            "GlobalParameters": [String:String]()
            ]
        return dict
    }
}
