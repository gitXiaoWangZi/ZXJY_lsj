//
//  UIColor-Extension.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import Foundation
import UIKit
 
extension UIColor {
    /*
     rgb取色
     */
    convenience init(r : CGFloat,g : CGFloat,b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    convenience init(hex : String) {
        var cString =  hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.count < 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }else{
            if cString.hasPrefix("0X") {
                cString = String(cString.dropFirst(2))
            }
            if cString.hasPrefix("#") {
                cString = String(cString.dropFirst(1))
            }
            if cString.count != 6 {
                self.init(red: 0, green: 0, blue: 0, alpha: 0)
            }
        }
        
        let rString = String(cString.dropFirst(2))
        let gString = String(cString.dropFirst(2).prefix(2))
        let bString = String(cString.dropLast(2))
        
        var r : UInt64 = 0
        var g : UInt64 = 0
        var b : UInt64 = 0
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }
}
