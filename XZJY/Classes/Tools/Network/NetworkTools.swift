//
//  NetworkTools.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/18.
//

import Foundation
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(type : MethodType,urlString : String,params : [String : String]? = nil,finishedCallBack:@escaping((_ result : Any)->())) {
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: method, parameters: params).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            finishedCallBack(result)
        }
    }
}
