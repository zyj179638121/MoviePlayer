//
//  HLSystem.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/4.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import Alamofire

/// 统一FileManager
public let HLFileManager = NSFileManager.defaultManager()

/// 统一Notification
public let HLNoteCenter = NSNotificationCenter.defaultCenter()

let ShareMainController = ShareAppDelegate.window?.rootViewController as! RootTabBarController

let ShareApplication = UIApplication.sharedApplication()

let ShareAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

// 全局debugPrint状态
public enum HLDebugPrintStatusOption: Int {
    case Off = 0
    case On = 1
}

/// 是否审核
public var isJudgeVersion = false

///分享类型
public var HLShareType = 0

public let urlVersion: String = {
    if let url = NSUserDefaults.standardUserDefaults().stringForKey("urlVersion") {
        return url
    } else {
        return "v\(HLCurrentVersion.stringByReplacingOccurrencesOfString(".", withString: ""))r"
    }
}()

// 网络状态控制器
let HLNetStateManager = NetworkReachabilityManager(host: "www.baidu.com")!

///APIHost地址
internal let HLAPIHost: String = {
    var string: String
    //    #if DEBUG
    //        string = "http://api.lovek12.cn/\(urlVersion)"
//                string = "http://192.168.2.250:8013"
    //    #else
//        string = "https://api.lovek12.com/v190"
    string = "http://hl_shop.qkhl.net"
    //    #endif
    return string
}()

///APIHost地址
internal let LKAPIHost: String = {
    var string: String
    //    #if DEBUG
    //        string = "http://api.lovek12.cn/\(urlVersion)"
    //        string = "http://192.168.4.250/\(urlVersion)"
    //    #else
    string = "https://api.lovek12.com/v190"
    //    #endif
    return string
}()

/// 端口号
public let HLCode = "1001"

/// 全局变量记录用户账号
//var SharedUserAccount = UserModel.login()

/// 手机类型
public let HLDevive_type = "ios1"

/// 屏幕宽度
public var kScreenW: CGFloat = GetWindow.bounds.width

/// 屏幕高度
public let kScreenH = GetWindow.bounds.height

/// 屏幕尺寸
public let kScreenSize = GetWindow.bounds.size

/// 屏幕比例
public let kScreenScale = UIScreen.mainScreen().scale

/// 统一转场动画时长
public let kViewTransDuration = 0.25

public let GetWindow = UIApplication.sharedApplication().delegate!.window!!

//let ShareAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

/**
 设置状态栏样式为白色
 */
public func StatusBarStyleLight() {
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
}

/**
 设置状态栏样式为黑色
 */
public func StatusBarSytleDefault() {
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
}

/// 当前系统版本
public let HLCurrentVersion = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as! String
