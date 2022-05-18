//
//  MainBaseViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: 懒加载
    public lazy var navView : UIView = {
        let navView = UIView()
        navView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavBarAndStatusBarHeight)
        navView.backgroundColor = .white
        return navView
    }()
    
    lazy var leftButton : UIButton = {
        let leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: kStatusBarHeight, width: kNavHeight, height: kNavHeight)
        leftButton.setImage(UIImage(named: "nav_backArrow"), for: .normal)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = kGlobalBackColor
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(self.navView)
        self.navView.addSubview(self.titleLabel)
        self.titleLabel.text = self.title
        
        if (navigationController?.viewControllers.count)! > 1 {
            view.addSubview(leftButton)
        }
    }
    
    func setViewTitle(title : String) {
        titleLabel.text = title
    }

    @objc func clickLeftButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func configRightBarItem(title : String = "",imageName : String = "") {
        let rightButton = UIButton(frame: CGRect.zero)
        guard title.count != 0 || imageName.count != 0 else { return }
        if title.count != 0 && imageName.count != 0 {
            rightButton.setImage(UIImage(named: imageName), for: .normal)
            rightButton.setTitle(title, for: .normal)
        }else if title.count == 0 && imageName.count != 0 {
            rightButton.setImage(UIImage(named: imageName), for: .normal)
        }else {
            rightButton.setTitle(title, for: .normal)
        }
        navView.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(kStatusBarHeight)
            make.right.bottom.equalTo(0)
            make.width.equalTo(44)
        }
        rightButton.addTarget(self, action:#selector(rightBarButtonClick), for:.touchUpInside)
    }
    
    @objc func rightBarButtonClick() {
        
    }
}
