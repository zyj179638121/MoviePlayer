////
////  HLLoginUtils.swift
////  ShopClient
////
////  Created by MYKJ on 16/5/9.
////  Copyright © 2016年 MYKJ. All rights reserved.
////
//
//import UIKit
//
//enum HLUserAccountUtils {
//    /// 获取动态码
//    case GetVericode(user: String, type: String)
//    /// 登录
//    case Login(user: String, password: String)
//    /// 第三方登录
//    case ThirdLogin(stage: String, way: String, viewController: UIViewController)
//    /// 注册
//    case Register(user: String, password: String, vericode: String, invicode: String?)
//    /// 绑定手机
//    case BindPhone(user: String, password: String, vericode: String, invicode: String?)
//    /// 找回密码
//    case Retrieve(user: String, newPassword: String, vericode: String)
//    /// 修改手机
//    case Replace(user: String, password: String, vericode: String, newUser: String)
//    /// 检测手机是否被注册过
//    //    case CheckPhoneStatus()
//    // 验证登录密码
//    case CheckLoginPassword(password: String)
//    /// 修改登录密码
//    case ChangeLoginPassword(newPassword: String)
//    
//    
//    typealias requestClosure = AnyObject? -> Void
//    func resume(closure: requestClosure?) {
//        
//        switch self {
//            
//        case .GetVericode(let user, let way):
//            if user.isEmpty {
//                HLProgressHUD.Error.Custom(sNonInputPhoneNumber).show
//                break
//            }
//            if checkTelNumber(user) {
//                let params = ["mobile": user,"use_type": way]
//                
//                HLAPI.Ready.DyCode.requestAPI(params)
//                    .JSON {
//                        
//                        HLPrint("fengzhuang = \($0)")
//                        
//                        let note = $0["note"].string
//                        let status = $0["status"].int
//                        let code = $0["data"].int
//                        switch (status, note, code) {
//                        case let(state?, _, num) where state == 1:
//                            closure?(num)
//                            
//                            HLProgressHUD.Success.Custom(sSendenVeriCode).show
//                        case let(state?, msg?, _) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                    }
//                    .Failed { _ in
//                        HLProgressHUD.Error.Network.show
//                        
//                }
//            } else {
//                closure?(false)
//                HLProgressHUD.Error.Custom("手机号有误").show
//            }
//            
//        case .Login(let user, let password):
//            if checkUserPassword(user, password: password) {
//                // 登陆并获得token
//                let params = ["mobile": user,
//                              "password": password]
//                
//                HLPrint(params)
//                
//                HLAPI.Ready.Login.requestAPI(params)
//                    .JSON {
//                        let result = $0.dictionaryObject
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        
//                        switch (result, status, note) {
//                        case let(_, state?, msg?) where state == 0:
//                            HLProgressHUD.Error.Custom(msg).show
//                        case let(dict?, state?, _) where state == 1:
//                            SharedUserAccount = UserModel(dict: dict)
//                            if SharedUserAccount.status == .Success {
//                                // 将用户登录信息归档
//                                SharedUserAccount.mobile = user
//                                SharedUserAccount.saveAccount()
//                                closure?(nil)
//                             }
//                        default: break
//                        }
//                    }
//                    .Failed { _ in
//                        HLProgressHUD.Error.Network.show
//                }
//            }
//            
//        case .ThirdLogin(let stage, let way, let viewController):
//            HLPrint("stage = \(stage),way = \(way),vc = \(viewController)")
//            UMSocialSnsPlatformManager.getSocialPlatformWithName(stage).loginClickHandler(viewController, UMSocialControllerService.defaultControllerService(), false) {
//                
//                if $0.responseCode == UMSResponseCodeSuccess {
//                    
//                    if let snsAccount = UMSocialAccountManager.socialAccountDictionary()[stage] {
//                        let params = ["open_id": snsAccount.usid,
//                                      "type": way,
//                                      "nickname": snsAccount.userName,
//                                      "avatar_url": snsAccount.iconURL]
//                        HLPrint("params = \(params)")
//                        HLAPI.Ready.ThirdLogin.requestAPI(params)
//                            .JSON {
//                                HLPrint("result = \($0)")
//                                if let data = $0["data"].dictionary {
//                                    UserModel.removeAccount()
//                                    SharedUserAccount.user_id = data["user_id"]?.string?.intValue() ?? 1
//                                    SharedUserAccount.saveAccount()
//                                    closure?(data["state"]?.int)
//
//                                }
//                        }
//                        .Failed({
//                            HLPrint("result = \($0)")
//                        })
//                    }
//                }
//            }
//            
//        case .Register(let user, let password, let vericode, let invicode):
//            if checkUserPassword(user, password: password, vericode: vericode) {
//                var params = ["mobile": user,
//                              "password": password,
//                              "verify_code": vericode]
//                
//                HLPrint("invicode = \(invicode)")
//                
//                if invicode?.characters.count > 0 {
//                    if checkInvicode(invicode)  { params["platform_id"] = invicode }
//                    else {
//                        HLProgressHUD.Error.Custom("这不是邀请码！").show
//                        return
//                    }
//                    
//                }
//                
//                HLAPI.Ready.Register.requestAPI(params)
//                    .JSON {
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        switch (status, note) {
//                        case let (state?, _?) where state == 1:
//                            
////                            HLProgressHUD.Success.Custom(msg).show
//                            HLUserAccountUtils.Login(user: user, password: password).resume(closure)
//                            
//                            
//                        case let (state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                }
//            }
//            
//        case .BindPhone(let user, let password, let vericode, let invicode):
//            if checkUserPassword(user, password: password, vericode: vericode) {
//                var params = ["user_id": "\(SharedUserAccount.user_id)",
//                              "mobile": user,
//                              "password": password,
//                              "code": vericode]
//                
//                if checkInvicode(invicode) || checkRouterID(invicode) { params["platform_id"] = invicode }
//                
//                HLPrint("params = \(params)")
//                
//                HLAPI.Ready.ThirdBind.requestAPI(params)
//                    .JSON {
//                        HLPrint("result = \($0)")
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        
//                        switch (status, note) {
//                        case let(state?, _) where state == 1:
//                            HLUserAccountUtils.Login(user: user, password: password).resume(closure)
//                        case let(state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                }
//            }
//            
//        case .Retrieve(let user, let newPassword, let vericode):
//            if checkUserPassword(user, password: newPassword, vericode: vericode) {
//                let params = ["mobile": user,
//                              "password": newPassword,
//                              "verify_code": vericode]
//                
//                HLAPI.Ready.ForgetPassword.requestAPI(params)
//                    .JSON {
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        
//                        switch (status, note) {
//                        case let(state?, msg?) where state == 1:
//                            HLProgressHUD.Success.Custom(msg).show
//                            closure?(nil)
//                        case let(state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                }
//            }
//            
//        case .Replace(let user, let password, let vericode, let newUser):
//            if checkUserPassword(user, password: password, vericode: vericode) {
//                let params = ["mobile": user,
//                              "newmobile": newUser,
//                              "password": password,
//                              "code": vericode]
//                
//                debugPrint("user:\(user),newUser:\(newUser)")
//                HLAPI.Ready.ChangePhone.requestAPI(params)
//                    .JSON {
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        
//                        switch (status, note) {
//                        case let(state?, msg?) where state == 1:
//                            SharedUserAccount.mobile = newUser
//                            SharedUserAccount.saveAccount()
////                            HLProgressHUD.Success.Custom(msg).show
//                            closure?(nil)
//                        case let(state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                        
//                }
//            }
//        case .CheckLoginPassword(let password):
//            if checkUserPassword("18515381796", password: password){
//                let params:[String:AnyObject] = ["user_id":SharedUserAccount.user_id,"password":password]
//                HLAPI.Ready.CheckPassword.requestAPI(params)
//                .JSON({
//                    HLPrint("password result = \($0)")
//                    let status = $0["status"].int
//                    let note = $0["note"].string
//                    switch (status, note) {
//                    case let (state?, _?) where state == 1:
//                        closure?(nil)
//                    case let (state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                    default: break
//                    }
//                })
//                .Failed({ _ in
//                    HLProgressHUD.Error.Network.show
//                })
//            }
//        case .ChangeLoginPassword(let newPassword):
//            if checkUserPassword("18515381796", password: newPassword){
//                let params:[String:AnyObject] = ["user_id":SharedUserAccount.user_id,"password":newPassword]
//                HLAPI.Ready.ChangePassword.requestAPI(params)
//                    .JSON({
//                        HLPrint("password result = \($0)")
//                        let status = $0["status"].int
//                        let note = $0["note"].string
//                        switch (status, note) {
//                        case let (state?, _?) where state == 1:
//                            closure?(nil)
//                        case let (state?, msg?) where state != 1:
//                            HLProgressHUD.Error.Custom(msg).show
//                        default: break
//                        }
//                    })
//                    .Failed({ _ in
//                        HLProgressHUD.Error.Network.show
//                    })
//            }
//            
//        }
//    }
//}
//
//private func checkUserPassword(user: String, password: String, vericode: String? = nil) -> Bool {
//    if user.isEmpty || password.isEmpty || (vericode?.isEmpty ?? false) {
//        HLProgressHUD.Error.Custom(sPleaseEnterCompleteInformation).show
//        return false
//    } else if password.characters.count < 6 {
//        HLProgressHUD.Error.Custom(sPasswordFormatError).show
//        return false
//    } else if password.characters.count > 20{
//        HLProgressHUD.Error.Custom(sPasswordFormatError).show
//        return false
//        
//    } else if !checkTelNumber(user) {
//        HLProgressHUD.Error.Custom(sEntertelNumber).show
//        return false
//    } else {
//        return true
//    }
//}
//
//// 检查商户码是否符合规范
//private func checkInvicode(code: String?) -> Bool{
//    let pattern = "^\\d{6}$"
//    let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
//    return predicate.evaluateWithObject(code)
//}
//
//// 检查路由vendorID是否符合规范
//private func checkRouterID(code: String?) -> Bool {
//    guard code == nil else {
//        return true
//    }
//    return false
//}
//
//// 检查手机号是否符合规范
//private func checkTelNumber(telNumber: String?) -> Bool{
//    let pattern = "^1+[3578]+\\d{9}"
//    let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
//    return predicate.evaluateWithObject(telNumber)
//}
