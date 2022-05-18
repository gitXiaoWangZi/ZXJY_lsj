//
//  AddressTableViewCell.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/18.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var model : [String : Any]? = [String : Any]() {
        didSet {
            
//            do {
//                guard let contactImage = model?["contactImage"] else {
//                    iconImageView.image = UIImage(named: "profile_setting")
//                    return
//                }
//                let image = contactImage as! String
//                guard image.count != 0 else {
//                    return
//                }
//                let url = URL(string: (image as! String))!
//                let data = try Data(contentsOf: url)
//                iconImageView.image = UIImage(data: data)
//            } catch {
//                print("shibai")
//            }
            
            guard let name = model?["contactName"] else {
                return
            }
            nameLabel.text = (name as! String)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
