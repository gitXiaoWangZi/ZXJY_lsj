//
//  HomeViewController.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/16.
//

import UIKit

private let cellID = "cellid"
class HomeViewController: BaseViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: kScreenWidth - 40, height: 100)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.headerReferenceSize = CGSize(width: 10, height: kScreenHeight)
        flowLayout.footerReferenceSize = CGSize(width: 10, height: kScreenHeight)
        
        let collectionV = UICollectionView(frame: CGRect(x: 0, y: kNavBarAndStatusBarHeight, width: kScreenWidth, height: kScreenHeight - kNavAndTabHeight), collectionViewLayout: flowLayout)
        collectionV.backgroundColor = UIColor.yellow
        collectionV.dataSource = self
        collectionV.delegate = self
        collectionV.isPagingEnabled = true
        collectionV.register(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
//        collectionV.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return collectionV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    @IBAction func jumpAction(_ sender: UIButton) {
        let desVC = DesViewController()
        if textField.text?.count == 0 {
            desVC.addressStr = "南苑站"
        }else{
            desVC.addressStr = textField.text!
        }
        navigationController?.pushViewController(desVC, animated: true)
    }
    
    @IBAction func selectAddress(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            textField.text = "南苑站"
        }else if sender.selectedSegmentIndex == 1 {
            textField.text = "高沙路站"
        }else {
            textField.text = "晓城天地一幢"
        }
    }
    
    
}
// MARK: -设置UI界面
extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = UIColor.orange
        //设置navbar
//        setupNavBar()
        self.navView.isHidden = true
        //设置collectionview
//        setupCollectionView()
    }
    
    private func setupNavBar() {
        let barItem = UIBarButtonItem(imageName: "nav", size: CGSize(width: 20, height: 20))
        let twoBarItem = UIBarButtonItem(title: "  好32454的 >  ")
        navigationItem.leftBarButtonItems = [barItem,twoBarItem]
    }
    
    private func setupCollectionView(){
        view.addSubview(collectionView)
    }
    
    
}

// MARK: -设置CollectionView代理
extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = collectionView.contentOffset
        let index = offset.x / kScreenWidth
        print(index)
        if index * 10 > 10 || index == 0 {
            return
        }
        self.collectionView.setContentOffset(CGPoint(x: offset.x - 30, y: 0), animated: true)

        
        
    }
}

