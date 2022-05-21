//
//  DesViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/20.
//

import UIKit

class DesViewController: UIViewController {

    var addressStr : String = "" {
        didSet {
            addressL.text = addressStr
        }
    }
    private lazy var imageV : UIImageView = {
        let imageV = UIImageView(frame: view.bounds)
        imageV.image = UIImage(named: "1")
        return imageV
    }()
    
    private lazy var back : UIButton = {
        let back = UIButton(frame: CGRect.zero)
        back.setTitle("", for: .normal)
        let action = UIAction { [self] kAction in
            navigationController?.popViewController(animated: true)
        }
        if #available(iOS 14.0, *) {
            back.addAction(action, for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
        return back
    }()
    
    private var cycleTimer : Timer!
    private var v : UIView = {
        let v = UIView(frame: CGRect.zero)
//        v.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        v.backgroundColor = .white
        return v
    }()
    private var l : UILabel = {
        let l = UILabel(frame:CGRect.zero)
        l.font = UIFont.boldSystemFont(ofSize: 37)
        l.textColor = UIColor(red: 108.0/255.0, green: 170.0/255.0, blue: 110.0/255.0, alpha: 1)
        l.textAlignment = .center
        return l
    }()
    
    private var timeL : UILabel = {
        let timeL = UILabel(frame:CGRect.zero)
        timeL.font = UIFont.boldSystemFont(ofSize: 56)
        timeL.textColor = UIColor(red: 108.0/255.0, green: 170.0/255.0, blue: 110.0/255.0, alpha: 1)
        timeL.textAlignment = .center
        return timeL
    }()
    
    private var addressL : UILabel = {
        let addressL = UILabel(frame:CGRect.zero)
        addressL.font = UIFont.boldSystemFont(ofSize: 16)
        addressL.textColor = .black
        addressL.textAlignment = .center
        addressL.backgroundColor = .white
        return addressL
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageV)
        
        let statusV = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusBarHeight))
        statusV.backgroundColor = .white;
        view.addSubview(statusV)
        
        view.addSubview(v)
        v.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(130)
            make.width.equalTo(250)
            make.height.equalTo(100)
        }
        
        v.addSubview(l)
        l.snp.makeConstraints { make in
            make.top.equalTo(-3)
            make.centerX.equalTo(v)
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        
        v.addSubview(timeL)
        timeL.snp.makeConstraints { make in
            make.bottom.equalTo(9)
            make.centerX.equalTo(v)
            make.width.equalTo(250)
            make.height.equalTo(60)
        }
        
        view.addSubview(addressL)
        addressL.snp.makeConstraints { make in
            make.top.equalTo(v.snp_bottom).offset(50)
            make.centerX.equalTo(v)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(back)
        back.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.right.equalTo(0)
            make.width.height.equalTo(100)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addCycTimer()
    }
    
    func addCycTimer() {
        cycleTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(dealWithTime), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode:.common)
    }
    
    func removeTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    @objc func dealWithTime() {
            let date = NSDate()
            let dateFormatter1 = DateFormatter()
            let dateFormatter2 = DateFormatter()
            dateFormatter1.dateFormat = "MM月dd日"
            dateFormatter2.dateFormat = "HH:mm:ss"
            let strDate1 = dateFormatter1.string(from: date as Date)
            let strDate2 = dateFormatter2.string(from: date as Date)
            l.text = strDate1
            timeL.text = strDate2
            addressL.text = addressStr
    }
    
    deinit {
        removeTimer()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        exit(0)
    }
}
