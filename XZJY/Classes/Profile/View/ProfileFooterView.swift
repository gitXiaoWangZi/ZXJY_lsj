//
//  ProfileFooterView.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit

class ProfileFooterView: UIView {
    
    
    @IBOutlet weak var outLoginView: UIView!
    @IBOutlet weak var versionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        autoresizingMask = .none
    }

    
}

extension ProfileFooterView {
    class func profileFooterView() -> ProfileFooterView {
        return Bundle.main.loadNibNamed("ProfileFooterView", owner: nil, options: nil)?.first as! ProfileFooterView
    }
}
