//
//  Common.swift
//  XZJY
//
//  Created by 刘圣洁 on 2022/5/17.
//

import Foundation
import UIKit
import SnapKit

///*屏幕宽度*
let kScreenWidth = UIScreen.main.bounds.size.width
///*屏幕高度*
let kScreenHeight = UIScreen.main.bounds.size.height
/// iPhone设备
let kIs_iphone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
////// iPhone4设备
let isIPhone4 = (max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.height) < 568.0 ? true : false)
/// iPhone5设备
let isIPhone5 = (max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.height) == 568.0 ? true : false)
/// iPhone6设备
let isIPhone6 = (max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.height) == 667.0 ? true : false)
/// iPhone6Plus设备
let isIPhone6P = (max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.height) == 736.0 ? true : false)

///*是否是X以上机型*
let kIs_iPhoneX = ((kScreenWidth >= 375.0) && (kScreenHeight >= 812.0) && (kIs_iphone))
///*状态栏高度*
let kStatusBarHeight = kIs_iPhoneX ? (44.0):(20.0)
///*状态栏和导航栏总高度*
let kNavBarAndStatusBarHeight = kIs_iPhoneX ? (88.0):(64.0)
///*底部安全区域远离高度*
let kBottomSafeHeight = kIs_iPhoneX ? (34.0):(0)
///*iPhoneX的状态栏高度差值*
let kTopBarDifHeight = kIs_iPhoneX ? (24.0):(0)
///*TabBar高度*
let kTabBarHeight = kIs_iPhoneX ? (83.0):(49.0)
///*导航条和Tabbar总高度*
let kNavAndTabHeight = (kNavBarAndStatusBarHeight + kTabBarHeight)
///*导航条高度*
let kNavHeight = 44.0

let kGlobalColor = UIColor(hex: "#904097")
let kGlobalBackColor = UIColor(hex: "#fffcff")
