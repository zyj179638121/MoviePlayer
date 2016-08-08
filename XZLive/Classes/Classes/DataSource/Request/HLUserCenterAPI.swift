////
////  HLUserCenterAPI.swift
////  ShopClient
////
////  Created by MYKJ on 16/5/17.
////  Copyright © 2016年 MYKJ. All rights reserved.
////
//
//import Foundation
//// MARK: - 用户中心
//enum HLUserCenterAPI: HLAPIType {
//    /// 用户中心
//    case UserCenter
//    /// 用户头像上传
//    case AvatarUpload
//    /// 修改密码
//    case ModifyPassword
//    /// 用户反馈
//    case UserFeed
//    /// 获取用户信息
//    case UserInfo
//    /// 获取用户地址
//    case UserInfoAddress
//    /// 上传用户信息
//    case UserInfoUpload
//    /// 积分商城
//    case PointsShop
//    /// 我的积分
//    case MyPoints
//    /// 抽奖
//    case Lottery
//    /// 签到
//    case SignIn
//    ///赚积分
//    case GetPoints
//    ///商户个人信息
//    case QRPayShopInfo
//    ///扫码优惠券
//    case QRPayShopCoupons
//    ///根据商铺id获取图片大图
//    case WebShopImg
//    ///获取积分兑换优惠劵列表
//    case ExchangeCoupon
//    ///积分兑换优惠劵
//    case ExchangeCouponsInfo
//    ///判断商户是否存在
//    case JudgeExistShopID
//    ///购买后送积分
//    case PayFinishGetPoint
//    ///用户积分抽奖
//    case IntegralDraw
//    ///注册后送积分
//    case AwardPoints
//    
//    ///录音上传接口
//    case RecordingUpload
//    case RecordingUploadNew
//    ///积分详细-月
//    case RewardsByMonth
//    ///积分详细-日
//    case RewardsByDay
//    ///分享后送积分
//    case ShareGetPoints
//    ///根据评论ID获取图片大图
//    case GetImage
//    
//    /// 必填参数
//    var required: (method: HLMethod, url: String) {
//        get {
//            switch self {
//            case .UserCenter:
//                return (.GET, API_UserCenter)
//            case .AvatarUpload:
//                return (.POST, API_UserIconUpload)
//            case .ModifyPassword:
//                return (.GET, API_ModifyPassword)
//            case .UserFeed:
//                return (.POST, API_UserFeed)
//            case .UserInfo:
//                return (.GET, API_GetInfo)
//            case .UserInfoAddress:
//                return (.GET, API_GetInfoAddress)
//            case .UserInfoUpload:
//                return (.POST, API_UserInfoUpload)
//            case .RecordingUpload:
//                return (.GET, API_RecordingUpload)
//            case .RecordingUploadNew:
//                return (.GET, API_RecordingUploadNew)
//            case .PointsShop:
//                return (.GET, API_PointsShop)
//            case .MyPoints:
//                return (.GET, API_MyPoints)
//            case .Lottery:
//                return (.GET, API_Lottery)
//            case .SignIn:
//                return (.GET, API_SignIn)
//            case .GetPoints:
//                return (.GET, API_GetPoints)
//            case .QRPayShopInfo:
//                return (.GET, API_QRPayShopInfo)
//            case .QRPayShopCoupons:
//                return (.GET, API_QRPayShopCoupons)
//            case .WebShopImg:
//                return (.GET, API_WebShopImg)
//            case .ExchangeCoupon:
//                return (.GET, API_ExchangeCoupon)
//            case .ExchangeCouponsInfo:
//                return (.GET, API_ExchangeCouponsInfo)
//            case .JudgeExistShopID:
//                return (.GET, API_JudgeExistShopID)
//            case .PayFinishGetPoint:
//                return (.GET, API_PayFinishGetPoint)
//            case .IntegralDraw:
//                return (.GET, API_IntegralDraw)
//            case .RewardsByMonth:
//                return (.GET, API_RewardsMonth)
//            case .RewardsByDay:
//                return (.GET, API_RewardsDay)
//            case .GetImage:
//                return (.GET, API_GetImage)
//            case .AwardPoints:
//                return (.GET, API_AwardPoints)
//            case .ShareGetPoints:
//                return (.GET, API_ShareGetPoints)
//            }
//        }
//    }
//}