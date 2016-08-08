//
//  NSTimeInterval.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation

extension NSTimeInterval {
    /**
     将NSTimeInterval类型的秒值转换为HH:mm:ss风格的的字符串
     
     @return 日期字符串
     */
    func formattedTime() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        if self >= 3600 {
            formatter.dateFormat = "HH:mm:ss"
        } else {
            formatter.dateFormat = "mm:ss"
        }
        return formatter.stringFromDate(date)
    }
}