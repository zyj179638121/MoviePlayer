//
//  HLAPIType.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/6.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import Alamofire

typealias HLMethod = Alamofire.Method

protocol HLAPIType {
    /// 必须实现的计算属性
    var required: (method: HLMethod, url: String) { get }
}

extension HLAPIType {
    func requestAPI(params: [String: AnyObject]? = nil, _ headers: [String: String]? = nil) -> HLAPIRequest {
        /// API请求必填参数
        var parameters = params ?? [:]
        parameters["device_type"] = "ios1"
        return Alamofire.request(required.method, required.url, parameters: parameters, encoding: .URL, headers: headers).toLKAPIRequest()
    }
}