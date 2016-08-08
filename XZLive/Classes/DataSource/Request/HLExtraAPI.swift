//
//  HLExtraAPI.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/11.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
enum HLExtraAPI: HLAPIType {
    /// 自定义字段
    case Custom(HLMethod, String)
    
    /// 必填参数
    var required: (method: HLMethod, url: String) {
        get {
            switch self {
            case .Custom(let m, let u):
                return (m, u)
  
            }
        }
    }
}