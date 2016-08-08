//
//  UIColor.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    // 输入形如#FFAABBCC 或者FFAABBCC这样的字符串可生成对应的UIColor，支持3位(RBG)4位(RBGA)6位(RRBBGG)8位(RRBBGGAA)四种格式，#标识可不输入
    convenience init(hex: String) {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var preHex = hex
        
        if hex.hasPrefix("#") {
            let index = hex.startIndex.advancedBy(1)
            preHex = hex.substringFromIndex(index)
        }
        let scanner = NSScanner(string: preHex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexLongLong(&hexValue) {
            
            switch (preHex.characters.count) {
            case 3:
                
                red = CGFloat((hexValue & 0xF00) >>  8) / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
                blue = CGFloat(hexValue & 0x00F) / 15.0
                
            case 4:
                
                red = CGFloat((hexValue  & 0xF000) >> 12) / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
                blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
                alpha = CGFloat(hexValue & 0x000F) / 15.0
                
            case 6:
                
                red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(hexValue & 0x0000FF) / 255.0
                
            case 8:
                
                red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(hexValue & 0x000000FF) / 255.0
                
            default:
                debugPrint("无效的十六进制RGB／RGBA字符串")
            }
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}