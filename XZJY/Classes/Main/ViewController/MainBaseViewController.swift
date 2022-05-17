//
//  MainBaseViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit

class BaseViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(self.navView)
        self.navView.addSubview(self.titleLabel)
        self.titleLabel.text = self.title
        
        if (navigationController?.viewControllers.count)! > 1 {
            view.addSubview(leftButton)
        }
    }
    
//    - (void)setViewTitle:(NSString *)title;
    func setViewTitle(title : String) {
        titleLabel.text = title
    }

    @objc func clickLeftButton() {
        navigationController?.popViewController(animated: true)
    }

    lazy var navView : UIView = {
        let navView = UIView()
        navView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavBarAndStatusBarHeight)
        navView.backgroundColor = .white
        return navView
    }()
    
    lazy var leftButton : UIButton = {
        let leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: kStatusBarHeight, width: kNavHeight, height: kNavHeight)
        leftButton.setImage(UIImage(named: "nav_back_icon"), for: .normal)
        leftButton.adjustsImageWhenHighlighted = false
        leftButton.addTarget(self, action: #selector(clickLeftButton), for: .touchUpInside)
        return leftButton
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 150, y: kStatusBarHeight, width: kScreenWidth - 300, height: kNavHeight))
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
}
