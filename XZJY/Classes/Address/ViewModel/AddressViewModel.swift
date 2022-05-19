//
//  AddressViewModel.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/19.
//

import Foundation

extension AddressViewController {
    func configData(listArr : [AddressListModel]) -> (Int , Int) {
        var firstIndex : Int = 0
        var lastIndex : Int = 0
        
        guard listArr.count != 0 else { return (0,0) }
        
        let firstModel = listArr.first
        if firstModel?.charName == "群聊" {
            firstIndex = firstModel?.contactList?.count ?? 0
        }else{
            firstIndex = 0
        }
        
        for item in listArr {
            lastIndex += item.contactList?.count ?? 0
        }
        return (firstIndex,lastIndex-firstIndex)
    }
}
