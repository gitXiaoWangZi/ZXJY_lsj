//
//  UIBarButtonItem-Extension.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/16.
//

import UIKit

extension UIBarButtonItem {
    //设置图片按钮
    convenience init(imageName : String,size : CGSize) {
        let button = UIButton()
        
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName), for: .highlighted)
        
        button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        self.init(customView: button)
    }
    
    //设置文字按钮
    convenience init(title : String) {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor(r: 243, g: 239, b: 242)
        button.sizeToFit()
        button.layer.cornerRadius = button.bounds.size.height / 2
        button.layer.masksToBounds = true
        
        
        self.init(customView: button)
    }
}
