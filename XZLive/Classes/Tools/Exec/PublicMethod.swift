////
////  PublicMethod.swift
////  ShopClient
////
////  Created by 安跃超 on 16/5/11.
////  Copyright © 2016年 MYKJ. All rights reserved.
////
//
//import Foundation
//
/////// 检查user_id是否存在，并返回user_id
////public func HLCheckUserID(UIDCANONE: Bool) -> Int {
////    
////    if UIDCANONE == false && SharedUserAccount.user_id == 1 {
////        HLProgressHUD.Error.Custom("您尚未登录，登录后方可完成此操作").show
////        ShareAppDelegate.window?.rootViewController?.presentViewController(SB_Login.initialVC!, animated: true, completion: nil)
////    }
////    return SharedUserAccount.user_id ?? 1
////}
//
//// 检查手机号是否符合规范
//public func checkPhoneNumber(telNumber: String?) -> Bool{
//    let pattern = "^1+[3578]+\\d{9}"
//    let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
//    return predicate.evaluateWithObject(telNumber)
//}
//
//// 拨打电话
//public func callPhoneWithPhoneNumber(telNumber: String , vc: UIViewController) {
//    let phoneAlert = UIAlertController.init(title: nil, message: telNumber, preferredStyle: .Alert)
//    let phoneAction = UIAlertAction.init(title: "呼叫", style: .Default, handler: { (action) in
//        let phoneStr = "tel:\(telNumber)"
//        HLPrint("phoneStr = \(phoneStr)")
//        UIApplication.sharedApplication().openURL(NSURL(string: phoneStr)!)
//    })
//    
//    let cancleAction = UIAlertAction.init(title: "取消", style: .Cancel, handler: { (action) in
//        
//    })
//    
//    phoneAlert.addAction(phoneAction)
//    phoneAlert.addAction(cancleAction)
//    
//    dispatch_async(dispatch_get_main_queue()) {
//        
//        vc.presentViewController(phoneAlert, animated: true, completion: {
//            
//        })
//    }
//}
//
