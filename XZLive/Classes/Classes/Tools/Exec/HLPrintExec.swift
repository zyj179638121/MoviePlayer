//
//  HLPrint.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation

/// Debug输出开关
public var HLDebugPrintStatus = HLDebugPrintStatusOption.On

/// Debug模式Log输出
public func HLPrint(items: Any...) {
    if HLDebugPrintStatus == HLDebugPrintStatusOption.On {
        debugPrint(items)
    }
}