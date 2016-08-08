//
//  NSTimer.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation


extension NSTimer {
    func pauseTimer(){
        if !self.valid{
            return
        }
        self.fireDate = NSDate.distantFuture()
    }
    
    
    func resumeTimer() {
        if !self.valid{
            return
        }
        self.fireDate = NSDate()
    }
    
}