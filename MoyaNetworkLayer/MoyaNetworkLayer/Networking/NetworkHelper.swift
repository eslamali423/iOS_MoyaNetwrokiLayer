//
//  BGNetworkHelper.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
import Moya
import SystemConfiguration

struct NetworkHelper {
    
    // MARK: - print response
    fileprivate static func printResponse(_ response: Response) {
        // print request data
        print("URL:")
        print(response.request?.urlRequest ?? "")
        print("Header:")
        print((response.request?.headers ?? nil) as Any)
        print("STATUS:")
        print(response.statusCode)
        print("Response:")
        if let json = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) {
            print(json)
        } else {
            let response = String(data: response.data, encoding: .utf8)!
            print(response)
        }
    }
    
    // MARK: - validate all APIs responses
    static func validateResponse (response:Response) ->Bool {
        printResponse(response)
        guard response.statusCode == Constants.success else{
            if response.statusCode == 401 {
               //logout()
            }
            return false
        }
        let decoder = JSONDecoder()
        do {
            let responseModel = try decoder.decode(ResponseModel.self, from: response.data)
            switch responseModel.status {
            case Constants.success? :
                return true
            case Constants.added? , Constants.created?:
               // show message
                return true
            case Constants.unprocessableEntity?:
                // show message
                return false
            case Constants.notFound?:
                // show message
                return false
            case Constants.unauthenticated?:
                // show message
               // logout
                return false
            case Constants.notActive?:
                // show message
                return  true
            default:
                return false
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
        
    }
    
}
