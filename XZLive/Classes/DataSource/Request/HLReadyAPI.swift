////
////  HLReadyAPI.swift
////  ShopClient
////
////  Created by MYKJ on 16/5/17.
////  Copyright © 2016年 MYKJ. All rights reserved.
////
//
//import Foundation
///// MARK: - Ready
//enum HLReadyAPI: HLAPIType {
//    /// 登录API
//    case Login
//    /// 登出API
//    case Logout
//    /// 注册API
//    case Register
//    /// 请求动态码
//    case DyCode
//    /// 注册请求验证码
//    case RegisterDyCode
//    /// 忘记密码
//    case ForgetPassword
//    /// 第三方登录接口
//    case ThirdLogin
//    /// 第三方绑定接口
//    case ThirdBind
//    /// 更改手机绑定
//    case ChangePhone
//    /// 验证手机是否已被注册过
//    case CheckPhoneNum
//    /// 绑定商户号
//    case BindBusinessesID
//    /// 完善信息
//    case CompleteInformation
//    /// 验证密码
//    case CheckPassword
//    /// 修改密码
//    case ChangePassword
//    
//    var required: (method: HLMethod, url: String) {
//        get {
//            switch self {
//            case .Login:
//                return (.GET, API_Login)
//            case .Logout:
//                return (.POST, API_Logout)
//            case .Register:
//                return (.GET, API_Register)
//            case .DyCode:
//                return (.GET, API_DyCode)
//            case .RegisterDyCode:
//                return (.GET, API_RegisterDyCode)
//            case .ForgetPassword:
//                return (.GET, API_ForgetPassword)
//            case .ThirdLogin:
//                return (.GET, API_ThirdLogin)
//            case .ThirdBind:
//                return (.GET, API_ThirdBound)
//            case .ChangePhone:
//                return (.GET, API_ChangePhone)
//            case .CheckPhoneNum:
//                return (.POST, API_CheckPhoneNum)
//            case .BindBusinessesID:
//                return (.GET, API_BindBusinessesID)
//            case .CompleteInformation:
//                return (.GET, API_CompleteInformation)
//            case .CheckPassword:
//                return (.GET, API_CheckPassword)
//            case .ChangePassword:
//                return (.GET, API_ChangePassword)
//            }
//        }
//    }
//}