//
//  MainNavigationController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.backgroundColor = .white
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

