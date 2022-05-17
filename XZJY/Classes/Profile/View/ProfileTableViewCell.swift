//
//  ProfileTableViewCell.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var iconVIew: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var bottomLeadingCons: NSLayoutConstraint!
    
    var dataDic : [String:String]? {
        didSet {
            iconVIew.image = UIImage(named: dataDic?["imageName"] ?? "")
            titleLabel.text = dataDic?["content"] ?? ""
            /*
             hideType
             1、都不隐藏 都不缩减
             2、上隐藏 下不隐藏缩减
             3、上隐藏 下不隐藏
             4、上不隐藏 下不隐藏缩减
             */
            if dataDic?["hideType"] == "2" {
                topLine.isHidden = true
                bottomLine.isHidden = false
                bottomLeadingCons.constant = 50
            }else if dataDic?["hideType"] == "3" {
                topLine.isHidden = true
                bottomLine.isHidden = false
                bottomLeadingCons.constant = 0
            }else if dataDic?["hideType"] == "4" {
                topLine.isHidden = false
                bottomLine.isHidden = false
                bottomLeadingCons.constant = 50
            }else{
                topLine.isHidden = false
                bottomLine.isHidden = false
                bottomLeadingCons.constant = 0
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

