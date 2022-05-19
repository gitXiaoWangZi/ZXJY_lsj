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
    
    var model : AddressModel? {
        didSet {
            guard let contactImage = model?.contactImage else {
                iconImageView.image = UIImage(named: "profile_setting")
                return
            }
            iconImageView.kf.setImage(with: URL(string: contactImage), placeholder: UIImage(named: "profile_setting"), options: nil) { receivedSize, totalSize in
                
            } completionHandler: { image, error, cacheType, imageURL in
                
            }
            
            guard let name = model?.contactName else {return}
            nameLabel.text = name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
