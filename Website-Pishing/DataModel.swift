//
//  DataModel.swift
//  Website-Pishing
//
//  Created by Bertuğ Yılmaz on 27.12.2017.
//  Copyright © 2017 Bertuğ Yılmaz. All rights reserved.
//

import Foundation

class DataModel{
    private let SFH: String!
    private let PopUpWindow: String!
    private let SSLfinal_State: String!
    private let Request_URL: String!
    private let URL_of_Anchor: String!
    private let web_traffic: String!
    private let URL_Length: String!
    private let age_of_domain: String!
    private let having_IP_Address: String!
    
    var sfh: String {
        return SFH
    }
    var popUpWindow: String {
        return PopUpWindow
    }
    var sslFinalState: String {
        return SSLfinal_State
    }
    var request_url: String {
        return Request_URL
    }
    var urlOfAnchor: String {
        return URL_of_Anchor
    }
    var webTraffic: String {
        return web_traffic
    }
    var urlLength: String {
        return URL_Length
    }
    var ageOfDomain: String {
        return age_of_domain
    }
    var havingIpAdress: String {
        return having_IP_Address
    }
    
    init(sfh: String, popUp: String, ssl: String, request: String, urlAnchor: String, traffic: String, urlLength: String, age: String, havingIP: String ) {
        self.SFH = sfh
        self.PopUpWindow = popUp
        self.SSLfinal_State = ssl
        self.Request_URL = request
        self.URL_of_Anchor = urlAnchor
        self.web_traffic = traffic
        self.URL_Length = urlLength
        self.age_of_domain = age
        self.having_IP_Address = havingIP
    }
   
    func convertToDictionary()-> [String: AnyObject] {
        let dict: [String : AnyObject] = ["Inputs":
                            [
                                "input1":[
                                    [
                                        "SFH": "1",
                                        "popUpWindow": "-1",
                                        "SSLfinal_State": "1",
                                        "Request_URL": "-1",
                                        "URL_of_Anchor": "-1",
                                        "web_traffic": "1",
                                        "URL_Length": "1",
                                        "age_of_domain": "1",
                                        "having_IP_Address": "0"
                                        ]
                                    ]
                            ],
                    "GlobalParameters": []
            ] as [String : AnyObject]
        return dict
    }

}
