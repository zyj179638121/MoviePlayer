//
//  Thread.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation

func switchToMainThread(method: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), method)
}

/**
 快速创建dispatch_after
 
 - parameter time:  延时时间
 - parameter block: 代码执行块
 */
public func dispatch_after(time: Double, block: ()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), block)
}