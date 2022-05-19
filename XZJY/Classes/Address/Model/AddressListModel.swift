//
//  AddressListModel.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/18.
//

import UIKit
import SwiftyJSON

class AddressListModel {
    var contactList : [AddressModel]? = [AddressModel]()
    var charName : String? = ""
    
    init(json : JSON) {
        charName = json["charName"].stringValue
        charName = json["charName"].stringValue
        for item in json["contactList"].arrayValue {
            let model = AddressModel(json: item)
            contactList?.append(model)
        }
    }
}

class AddressModel {
    var id : String = ""
    var contactName : String = ""
    var contactImage : String = ""
    var contactType : Int = 0
    var charName : String = ""
    
    init(json : JSON) {
        id = json["id"].stringValue
        contactName = json["contactName"].stringValue
        contactImage = json["contactImage"].stringValue
        contactType = json["contactType"].intValue
        charName = json["charName"].stringValue
    }
}

/**
 "id": "b851dd2a75064135bc7c22f1f9048674",
 "contactName": "蔡红娟(指导师)",
 "contactImage": "http://amcimg.xingzhijiaoyu.net/commFile/oss/image/download/7b79a928731f49eda98af1b0ed13fa26.jpg",
 "contactType": 2,
 "charName": "CAI"
 */
