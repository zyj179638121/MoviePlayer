//
//  UIView.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

// UIView
extension UIView {
    /**
     获取当前view的控制器
     
     - returns: view的控制器
     */
    func getCurrentViewController() -> UIViewController? {
        var next = self.superview
        while next != nil {
            next = next?.superview
            let nextResponder = next?.nextResponder()
            if nextResponder!.isKindOfClass(UIViewController.classForCoder()) {
                return nextResponder as? UIViewController
            }
        }
        return nil
    }
    
    var x :CGFloat {
        get{
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    var y :CGFloat {
        get{
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    var height: CGFloat {
        get{
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    var width: CGFloat {
        get{
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
}