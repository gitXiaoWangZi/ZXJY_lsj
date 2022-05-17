//
//  ProgileViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import UIKit
 
private let cellId = "cellid"
private let headerViewId = "headerViewId"

class ProfileViewController: BaseViewController {

    private lazy var tableView : UITableView = {
        let tableV = UITableView(frame: CGRect.zero, style: .grouped)
        tableV.backgroundColor = kGlobalBackColor
        tableV.delegate = self
        tableV.dataSource = self
        tableV.separatorStyle = .none
        tableV.tableHeaderView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: kScreenWidth, height: 0)))
        tableV.register(UINib(nibName: "ProfileTableViewCell", bundle: nibBundle), forCellReuseIdentifier: cellId)
        tableV.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: headerViewId)
        tableV.tableHeaderView = ProfileTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        let footerV = ProfileFooterView.profileFooterView()
        footerV.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 108)
        tableV.tableFooterView = footerV
        return tableV
    }()
    
    private lazy var dataArray : [Any] = {
        /*
         hideType
         1、都不隐藏 都不缩减
         2、上隐藏 下不隐藏缩减
         3、上隐藏 下不隐藏
         4、上不隐藏 下不隐藏缩减
         */
        var arr = [
            [["imageName" : "profile_tongzhishu","content" : "开营通知书","hideType" : "4"],["imageName" : "profile_outline","content" : "线下工作坊","hideType" : "3"]],
            [["imageName" : "profile_dangan","content" : "家庭档案","hideType" : "4"],["imageName" : "profile_jifen","content" : "我的积分","hideType" : "2"],["imageName" : "profile_shoucang","content" : "我的收藏","hideType" : "3"]],
            [["imageName" : "profile_yijianfankui","content" : "意见反馈","hideType" : "1"]],
            [["imageName" : "profile_yinsixieyi","content" : "隐私协议","hideType" : "1"]]
        ]
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

// MARK: -设置UI界面
extension ProfileViewController {
    private func setupUI() {
        self.navView.isHidden = true
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-kTabBarHeight)
        view.addSubview(tableView)
    }
}

// MARK: -代理实现
extension ProfileViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionArr = dataArray[indexPath.section] as! [[String : String]]
        let rowDic = sectionArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none
        cell.dataDic = rowDic
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = dataArray[section] as! [[String : String]]
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewId)
        return headerView
    }
    
}

// MARK: sectionHeader
private class HeaderView : UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: tableView HeaderView
class ProfileTableViewHeaderView : UIView {
    
    var iconImageView : UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileTableViewHeaderView {
    private func setupUI() {
        backgroundColor = .white
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(70)
        }
        iconImageView.layer.cornerRadius = 35
        iconImageView.layer.masksToBounds = true
        iconImageView.image = UIImage(named: "profile_setting")
    }
}
