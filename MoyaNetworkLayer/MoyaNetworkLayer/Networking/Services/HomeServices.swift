//
//  HomeServices.swift
//  HersUser
//
//  Created by Eslam Ali  on 16/11/2022.
//


import Foundation
import Moya

enum HomeServices {
    case home
   
   
    
}

extension HomeServices : URLRequestBuilder {

    
    var path: String {
        switch self {
        case .home:
            return EndPoints.home.rawValue
    }
    }
    
    
    
    var method: Moya.Method {
        switch self {
            
        case .home:
            return .get
       
        }
    }
    
    var task: Task {
        switch self  {
        case .home:
            return .requestPlain
        }    }
    
    
    
}
