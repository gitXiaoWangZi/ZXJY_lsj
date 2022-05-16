//
//  HomeViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/16.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        setupUI()
    }

}
// MARK: -设置UI界面
extension HomeViewController {
    private func setupUI() {
        let barItem = UIBarButtonItem(imageName: "nav", size: CGSize(width: 20, height: 20))
        let twoBarItem = UIBarButtonItem(title: "  好32454的 >  ")
        navigationItem.leftBarButtonItems = [barItem,twoBarItem]
    }
}
