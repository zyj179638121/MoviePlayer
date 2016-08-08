//
//  PopoverPresentationController.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import UIKit

/// iOS 8.0 推出的，专门用于负责视图控制器之间的转场
class PopoverPresentationController: UIPresentationController {

    /// 展现视图的 frame
    var presentFrame = CGRectZero
    
    /// 遮罩视图
    lazy var dummyView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.clearColor()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.close))
        v.addGestureRecognizer(tap)
        
        return v
    }()
    
    ///  关闭展现视图控制器
    func close() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    ///  容器视图将要重新布局子视图
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 添加并且设置 dummyView
        dummyView.frame = containerView!.bounds
        containerView?.insertSubview(dummyView, atIndex: 0)
        
        // 设置视图大小
        presentedView()?.frame = presentFrame
    }
}
