////
////  HLAPIURL.swift
////  ShopClient
////
////  Created by MYKJ on 16/5/4.
////  Copyright © 2016年 MYKJ. All rights reserved.
////
//
//import Foundation
//
//// MARK: - Ready
///// 登录API POST mobile:手机号码(必填) password:用户密码(必填) token:(密钥, 有效期为1周)
//public let API_Login = "\(LKAPIHost)/index.php?r=site/login"
///// 登出API POST 无参数
//public let API_Logout = "\(LKAPIHost)/index.php?r=site/logout"
///// 注册API POST mobile:手机号码(必填) password:用户密码(必填) verify_code:验证码(必填，为方便测试验证码有效期为1天)
//public let API_Register = "\(LKAPIHost)/index.php?r=site/register"
///// 请求动态码 POST mobile:手机号码(必填)
//public let API_DyCode = "\(LKAPIHost)/index.php?r=site/get-verify-code"
///// 注册请求动态码
//public let API_RegisterDyCode = "\(LKAPIHost)/index.php?r=site/get-verify-code-new"
///// 忘记密码 POST mobile:手机号码(必填) password:用户密码(必填) verify_code:验证码(必填，为方便测试验证码有效期为1天)
//public let API_ForgetPassword = "\(LKAPIHost)/index.php?r=site/forget-password"
///// 第三方登录接口
//public let API_ThirdLogin = "\(LKAPIHost)/index.php?r=site/three-login"
///// 第三方绑定接口
//public let API_ThirdBound = "\(LKAPIHost)/index.php?r=site/three-bound"
///// 更改手机绑定
//public let API_ChangePhone = "\(LKAPIHost)/index.php?r=site/change-mobile"
///// 验证手机是否已被注册过
//public let API_CheckPhoneNum = "\(LKAPIHost)/index.php?r=site/verify-mobile"
//
//// MARK: - Center
///// 请求首页
//public let API_HOME = "\(HLAPIHost)/index.php?r=resource/index-app"
///// 请求全部课程 GET grade:年级（非必填） course:课程（非必填）
//public let API_AllLessionURL = "\(HLAPIHost)/index.php?r=resource/get-resource-by-gradex"
///// 请求搜索结果 GET key_word: 关键字（非必填）page:  分页条数（非必填，默认显示8条）
//public let API_SearchURL = "\(HLAPIHost)/index.php?r=resource"
////最新搜索
//public let API_SearchURLNew = "\(HLAPIHost)/index.php?r=resource/index-search"
////关键字搜索
//public let API_SearchKeyword = "\(HLAPIHost)/index.php?r=resource/user-search"
//public let API_SearchDelete = "\(HLAPIHost)/index.php?r=resource/delete-search"
///// 请求讲座首页 GET 无参数
//public let API_LectureURL = "\(HLAPIHost)/index.php?r=lecture"
///// 参与讲座请求 GET user_id 用户ID (必传) lecture_id 讲座ID (必传)
//public let API_LectureJoinURL = "\(HLAPIHost)/index.php?r=lecture/join"
///// 我参与的讲座 GET  user_id 用户ID (必传)
//public let API_MyLecture = "\(HLAPIHost)/index.php?r=user/my-lectures"
///// 首页更多视频
//public let API_MoreVideo = "\(HLAPIHost)/index.php?r=resource/resource-app"
//
//// MARK: - 用户中心
///// 用户中心 GET 无参数
//public let API_UserCenter = "\(HLAPIHost)/index.php?r=user/user-center"
///// 用户观看记录 GET 参数 user_id (必填)
//public let API_UserViewRecord = "\(HLAPIHost)/index.php?r=user/view-records"
///// 删除观看记录(批量/单个/清空) POST user_id (必填) resource_id (必填) flag=1 (选填，如果填写１则清空，可以不用填写record_id)
//public let API_UserRemoveRecord = "\(HLAPIHost)/index.php?r=user/remove-view-records"
///// 用户收藏列表 GET 参数 user_id 用户ID (必传)
//public let API_UserFavorites = "\(HLAPIHost)/index.php?r=user/my-collections"
///// 用户参与的讲座 GET 参数 user_id (必传) lecture_id (必传)
//public let API_UserLecture = "\(HLAPIHost)/index.php?r=user/my-lectures"
///// 用户头像上传 POST UserInfo[avatar] 文件标识 (必传) user_id 用户ID (必传)
//public let API_UserIconUpload = "\(HLAPIHost)/index.php?r=user/upload-avatar"
///// 修改密码 GET user_id:用户ID(必填) mobile:手机号码(必填) password:用户密码(必填) verify_code:验证码(必填，为方便测试验证码有效期为1天)
//public let API_ModifyPassword = "\(LKAPIHost)/index.php?r=site/modify-password"
///// 用户反馈 POST user_id 用户ID (必传) content 反馈内容
//public let API_UserFeed = "\(LKAPIHost)/index.php?r=feed-back/index"
///// 获取/上传用户信息 GET/POST user_id 用户ID (必传) nick_name 昵称 (非必传) grade 年级 (非必传) province_id 省份ID (非必传) city_id 城市ID (非必传) sex 性别 (非必传 1男 2女)
//public let API_UserInfo = "\(LKAPIHost)/index.php?r=user/user-info"
//
////public let API_UserInfoUpload = "\(LKAPIHost)/index.php?r=user/user-info-commit"
//
////录音上传接口  POST user_id recite_id录音ID video_file 视频名称 video_file_size 大小 <10M platform:ios
//public let API_RecordingUpload = "\(HLAPIHost)/index.php?r=recite/upload"
//public let API_RecordingUploadNew = "\(HLAPIHost)/index.php?r=recite/upload-new"
//
//// MARK: - Detail
///// 课程详情接口 GET id: 资源ID（必填）
//public let API_CourseDetail = "\(HLAPIHost)/index.php?r=resource/get-resource-info"
///// 资源下载请求 GET id: 资源ID（必填）
//public let API_Download = "\(HLAPIHost)/index.php?r=resource/down"
///// 资源收藏列表 GET user_id 用户ID (必传)
//public let API_MyCollection = "\(HLAPIHost)/index.php?r=user/my-collection"
///// 资源收藏请求 GET user_id: 用户ID resource_id: 资源ID（必填）
//public let API_Collection = "\(HLAPIHost)/index.php?r=resource/collection"
///// 资源取消收藏请求 GET user_id: 用户ID resource_id: 资源ID（必填）
//public let API_UnCollection = "\(HLAPIHost)/index.php?r=resource/un-collection"
///// 资源评论列表 GET resource_id: 资源ID（必填）flag(hot) (是否为热门评论)
//public let API_Comment = "\(HLAPIHost)/index.php?r=resource/comment"
///// 资源评论提交 POST resource_id: 资源ID（必填） user_id: 用户ID（必填） content: 评论（必填） repeat_id: 回复别人评论时
//public let API_Comment_commit = "\(HLAPIHost)/index.php?r=resource/comment"
///// 点赞提交 GET user_id 用户ID (必传) comment_id 评论ID (必传) prise_user_id 被赞的用户 (必传)
//public let API_Prise_commit = "\(HLAPIHost)/index.php?r=prise/index"
//
//// MARK: - Message通知
///// 我的评论列表 POST user_id
//public let API_MyCommentList = "\(HLAPIHost)/index.php?r=user/my-comments-one"
///// 系统消息列表 GET 无参数
//public let API_SysMessage = "\(HLAPIHost)/index.php?r=notice"
///// 我的赞列表 GET user_id
//public let API_MyPrisesList = "\(HLAPIHost)/index.php?r=user/my-prises"
//
//// MARK: - 朗读
///// 朗读资源列表 GET key_word 搜索关键字 (非必传) size 分页数，默认8条 (非必传)
//public let API_ReciteList = "\(HLAPIHost)/index.php?r=recite/index"
//
///// 我的朗读列表 GET user_id 用户ID (必传)
////public let API_MyReciteList = "\(HLAPIHost)/index.php?r=recite/get-recite-composed-list"
//public let API_MyReciteList = "\(HLAPIHost)/index.php?r=recite/get-polyv-recite-composed-list"
//
////上传成功后回调 GET id (回调ID) vid (保利视频id)
//public let API_ReciteCallBack = "\(HLAPIHost)/index.php?r=recite/callback-phone"
//
///// 朗读资源包下载 GET recite_id (朗诵ID)
//public let API_ReciteDownload = "\(HLAPIHost)/index.php?r=recite/down"
//
///// 删除朗读资源 post user_id (必填) letv_id (必填) flag=1 (选填，如果填写１则清空，可以不用填写letv_id)
////public let API_ReciteDelete = "\(HLAPIHost)/index.php?r=recite/remove-recite-composed"
////public let API_ReciteDelete = "\(HLAPIHost)/index.php?r=recite/remove-recite-polvy"
//public let API_ReciteDelete = "\(HLAPIHost)/index.php?r=recite/remove-recite-polvy"
//
//
//
//
//// MARK: - 支付相关
///// 获取订单
///// uid int
///// resource_id int
///// vip_level int [0-3]
///// charge_type char(5)  支付类型，微信的值为wx
///// fee float(10,2) 充值金额（不含会员费）
//public let API_GetOrder = "http://hl_shop.qkhl.net/api/v100/user_resource/get_order?"
//
///// uid 用户uid;
///// resource_id 购买资源ID，没有资料为0;
///// fee 充值金额;
///// charge_type 充值类型，支付宝类型为ali;
///// vip_mons 充值月数;
///// ctime 订单号;
//public let API_GetOrderInfo = "http://hl_shop.qkhl.net/api/v100/user_resource/get_order_info?"
////public let API_GetOrderInfo = "https://api.lovek12.com/v170/index.php?r=user-resource/get-order-info"
//
//
////public let API_GetOrderInfo = "https://api.lovek12.com/index.php?r=user-resource/get-order-info"
//
///// 购买资源
//// BuyResult可能存在的几种情况：
//// No               ：  视频记录有问题
//// FREE             ： 免费视频
//// BUYED           ：  已购买
//// ERROR           ：  接口异常
//// NOTUSER         ：  用户信息不完整
//// Insufficient Balance：余额不足
//// nobounding      ：  未绑定用户
//// OK              ：  购买成功
//public let API_BuyResource = "\(HLAPIHost)/index.php?r=user-resource/buy-resource"
//
///// 会员等级
//public let API_GetMemberLevel = "\(HLAPIHost)/index.php?r=user-resource/get-user-level"
//
///// 获取用户充值信息
//// uid
//public let API_GetUserPurchaseInfo = "\(HLAPIHost)/index.php?r=user-resource/get-user-charge"
//
///// 获取用户购买记录
//public let API_GetUserBuyRecord = "\(HLAPIHost)/index.php?r=user-resource/get-user-resource"
//
///// 绑定商户号 必填 user_id platform_id（推荐码）
//public let API_BindBusinessesID = "\(HLAPIHost)/index.php?r=site/binding-platorm"
//
///// 完善用户信息
//public let API_CompleteInformation = "\(HLAPIHost)/index.php?r=site/get-user-info"
///// 发现URL
//public let API_HomeURL = "\(HLAPIHost)/index.php/circle/index/index/\(HLCode)?"
//
///// 在线商城URL                     
//public let API_ShoppingOnlineURL = "http://dk.\(HLCode).qkhl.net/mobile/index.php"
//// http://dk.1001.qkhl.net/mobile/index.php
/////讲故事URL
//public let API_DiscoveryStory = "http://api.lovek12.com/index.php?r=discovery%2Fstory&v=190"
//
///// 绘画的秘密URL
//public let API_DiscoverySecret = "http://api.lovek12.com/index.php?r=discovery%2Fpicture-book-secret&v=190"
///*
// 参数 resource_id
// 请求地址 ：http://api.lovek12.com/index.php?r=discovery/get-content
// 请求方式： get
// 返回 ：{
// "status": 1,
// "data": {
// "descp": "《孔融让梨》经典成语，形式新颖，让你爱上学习。",
// "title": "《孔融让梨》成语故事，听嘉庆叔叔讲述中华上下五千年的传奇故事。",
// "url": "http://api.lovek12.com/index.php?r=discovery/lecture&id=229",
// "img_url": "http://test.lovek12.com/Uploads/Picture/2015-12-22/56790f97a6451.jpg"
// },
// "note": "资源信息"
// }
// */
//public let API_GetDiscoveryContent = "https://api.lovek12.com/index.php?r=discovery/get-content"
//
//// 检测版本号是否与线上版本一致
//public let API_CheckVersion = "\(HLAPIHost)/index.php?r=user/version"
//
//public let API_CheckAPIVersion = "\(HLAPIHost)/api/version/index?"
//
//public let API_GetCoupons = "\(HLAPIHost)/index.php?r=user-resource/get-coupons"
//
//// 验证登录密码是否正确
//public let API_CheckPassword = "\(HLAPIHost)/api/v100/site/is_pasword?"
//
//// 修改密码
//public let API_ChangePassword = "\(HLAPIHost)/api/v100/site/update_pasword?"
//
//// 获取个人信息
//public let API_GetInfo = "\(HLAPIHost)/api/v100/site/get_user_info?"
////上传个人信息
//public let API_UserInfoUpload = "\(HLAPIHost)/api/v100/site/user_info_commit?"
//
////获取用户地址
//public let API_GetInfoAddress = "\(HLAPIHost)/api/v100/site/get_user_addaress?"
//
//// 积分商城
//public let API_PointsShop = "\(HLAPIHost)/api/v100/integral_mall/index?"
//
////我的积分
//public let API_MyPoints = "\(HLAPIHost)/api/v100/site/my_integral?"
//
//// 我的购物车(h5)
//public let API_shoppingCart = "http://dk.\(HLCode).qkhl.net/mobile/index.php?m=default&c=flow&a=cart"
//
////小积分抽大奖
//public let API_Lottery = "\(HLAPIHost)/api/v100/integral_mall/integral_draw"
////赚积分
//public let API_GetPoints = "\(HLAPIHost)/api/v100/integral_mall/earn_points?"
////签到
//public let API_SignIn = "\(HLAPIHost)/api/v100/integral_mall/user_doSign"
//
////我的订单(h5)
//public let API_MyOrder = "\(HLAPIHost)/index.php/circle/order/stay_pay?"
//
////我的优惠券(h5)可选择
//public let API_Coupons = "\(HLAPIHost)/index.php/circle/shop_activity/coupon?coupon=1"
////我的优惠券(h5)不可选择
//public let API_CouponsNoSelect = "\(HLAPIHost)/index.php/circle/shop_activity/coupon?"
//
////本地服务(h5)
//public let API_LocalService = "\(HLAPIHost)/index.php/circle/shop/shop_list?"
////用户的优惠劵
//public let API_QRPayShopInfo = "\(HLAPIHost)/api/v100/merchant_site/merchant_details?"
////扫码优惠券
//public let API_QRPayShopCoupons = "\(HLAPIHost)/coupon/get_coupon_one?"
////消息(h5)
//public let API_Message = "\(HLAPIHost)/index.php/circle/message/index?"
//
////根据商铺id获取图片大图
//public let API_WebShopImg = "\(HLAPIHost)/api/v100/integral_mall/get_image?"
//
////获取积分兑换优惠劵列表
//public let API_ExchangeCoupon = "\(HLAPIHost)/api/v100/coupon/get_exchange_coupon"
//
////积分兑换优惠劵
//public let API_ExchangeCouponsInfo = "\(HLAPIHost)/api/v100/integral_mall/exchange_coupon?"
//
////判断商户是否存在
//public let API_JudgeExistShopID = "\(HLAPIHost)/api/v100/merchant_site/judge_merchant?"
//
////购买后送积分
//public let API_PayFinishGetPoint = "\(HLAPIHost)/api/v100/integral_mall/paycheck_points?"
//
////用户积分抽奖
//public let API_IntegralDraw = "\(HLAPIHost)/api/v100/integral_mall/user_draw?"
//
////积分奖励详细 - 月
//public let API_RewardsMonth = "\(HLAPIHost)/api/v100/integral_mall/reward_detail?"
//
////积分奖励详细 - 日
//public let API_RewardsDay = "\(HLAPIHost)/api/v100/integral_mall/reward_detail_day?"
//
////根据评论ID获取图片大图
//public let API_GetImage = "\(HLAPIHost)/api/v100/user/get_image?"
//
////注册后送积分
//public let API_AwardPoints = "\(HLAPIHost)/api/v100/integral_mall/size_points?"
//
////分享后送积分
//public let API_ShareGetPoints = "\(HLAPIHost)/api/v100/integral_mall/share_points?"
//
////支付完成后如果judgeType = 1 跳待支付页面
//public let API_judgeType = "\(HLAPIHost)/index.php/circle/order/has_been_completed?"