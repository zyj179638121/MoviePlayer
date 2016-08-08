//
//  HLColor.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

/**
 通过十六进制快速定义UIColor
 
 - parameter hex: 十六进制字符串
 
 - returns: UIColor
 */
public func HLColor (hex: String) -> UIColor {
    return UIColor(hex: hex)
}

/**
 快速定义UIColor
 
 - parameter r: 红色值
 - parameter g: 绿色值
 - parameter b: 蓝色值
 
 - returns: UIColor
 */
public func HLColor (r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

/**
 随机色
 
 - returns: UIColor
 */
public func HLRandomColor() -> UIColor {
    return HLColor(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
}