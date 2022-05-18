//
//  AddressViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/18.
//

import UIKit

class AddressViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(dViewController(), animated: true)
    }

}

// MARK: 创建UI部分
extension AddressViewController {
    private func setupUI() {
        self.setViewTitle(title: "通讯录")
        self.configRightBarItem(imageName: "nav_tonghujilu")
    }
}
