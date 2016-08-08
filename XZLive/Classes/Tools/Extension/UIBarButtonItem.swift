//
//  UIBarButtonItem.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

// UIBarButtonItem
extension UIBarButtonItem {
    /**
     *  创建一个包含了按钮的item
     *
     *  @param image     普通图片
     *  @param highImage 高亮图片
     *  @param target    点击item后会调用target的action方法
     *  @param action    点击item后调用的方法
     *
     *  @return item
     */
    class func itemWithImage(image: String, highImage: String, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: image), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: highImage), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        return self.init(customView: btn)
    }
}
