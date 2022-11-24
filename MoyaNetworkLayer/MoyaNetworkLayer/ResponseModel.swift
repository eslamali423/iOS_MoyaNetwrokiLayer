//
//  ResponseModel.swift
//  MoyaNetworkLayer
//
//  Created by Eslam Ali  on 23/11/2022.
//

import Foundation

struct ResponseModel : Codable{
    
    let status : Int?
    let msg : String?
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
    }
}
