//
//  AddressViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/18.
//

import UIKit
import SwiftyJSON

private let cellID = "cellId"

class AddressViewController: BaseViewController {
    
    lazy var addressArr : [AddressListModel] = {
        var addressArr = [AddressListModel]()
        return addressArr
    }()
    
    lazy var titleArr : [String] = {
        var titleArr = [String]()
        return titleArr
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = kGlobalBackColor
        tableView.register(UINib(nibName: "AddressTableViewCell", bundle: nibBundle), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionIndexColor = .darkGray
        tableView.sectionIndexBackgroundColor = .clear
        tableView.sectionIndexTrackingBackgroundColor = .clear
        return tableView
    }()
    
    lazy var footerView : UIView = {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 80))
        footerView.backgroundColor = kGlobalBackColor
        return footerView
    }()
    
    lazy var footerTitleL : UILabel = {
        let footerTitleL = UILabel(frame: CGRect.zero)
        footerTitleL.textColor = .darkGray
        footerTitleL.font = UIFont.systemFont(ofSize: 11)
        footerTitleL.textAlignment = NSTextAlignment.center
        return footerTitleL
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}

// MARK: 请求数据部分
extension AddressViewController {
    func loadData() {
//        NetworkTools.requestData(type: .POST, urlString: "http://chuanc.xingzhijiaoyu.net/inheritUserApi/api/contact/list/v39?sign=5e4dea3b295431854da8278973601d1f", params: ["appId":"B48B249C-B6E3-4F79-9F16-D6A65C0484D9","timestamp":"1652846721","appType":"2","userId":"d055531f5c4b49adb00c1518a15d87e1","version":"2.1.10"]) { result in
//            print(result)
//        }
        let path = Bundle.main.path(forResource: "AddressData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData : Dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
            let userList = jsonData["userList"] as! NSArray
            for item in userList {
                let i = JSON(item).dictionaryObject
                let k = AddressListModel(json: JSON(i as Any))
                addressArr.append(k)
            }
            print(addressArr)
        } catch let error as Error? {
            print("读取本地数据出现错误！",error ?? "")
        }
        for item in addressArr{
            guard let charName = item.charName else {
                return
            }
            titleArr.append(charName)
        }
        let peopleNum = configData(listArr: addressArr)
        guard peopleNum.0 != 0 || peopleNum.1 != 0 else {
            footerTitleL.isHidden = true
            return
        }
        footerTitleL.text = "\(peopleNum.0)个群聊、\(peopleNum.1)位联系人"
    }
}

// MARK: 创建UI部分
extension AddressViewController {
    private func setupUI() {
        self.setViewTitle(title: "通讯录")
        self.configRightBarItem(imageName: "nav_tonghujilu")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(kNavBarAndStatusBarHeight)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-kTabBarHeight)
        }
        
        
        //创建tableviewFooterview
        footerView.addSubview(footerTitleL)
        footerTitleL.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.tableFooterView = footerView
    }
}

// MARK: 实现代理
extension AddressViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return addressArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = addressArr[section]
        let rowArr = model.contactList
        return rowArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = addressArr[indexPath.section]
        let rowArr = model.contactList
        let item = rowArr?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! AddressTableViewCell
        cell.selectionStyle = .none
        cell.model = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArr[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArr
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
