//
//  UIViewController.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /**
     push效果的present跳转
     
     - parameter viewController: 跳转的控制器
     - parameter completion:     回调
     */
    public func presentPushEffect(viewController: UIViewController, completion: (() -> Void)?) {
        let effect = PersentAnimator.sharedPersentAnimation.then { $0.presentStlye = .CoverVertical }
        viewController.transitioningDelegate = effect
            dispatch_async(dispatch_get_main_queue()) { 
                
                self.presentViewController(viewController, animated: true, completion: completion)
        }

    }
    
    /**
     旋转效果的present跳转
     
     - parameter viewController: 跳转的控制器
     - parameter completion:     回调
     */
    public func presentFlipEffect(viewController: UIViewController, completion: (() -> Void)?) {
        viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(viewController, animated: true, completion: completion)
    }
    
    /// navigationPush
    public func navigationPopViewControllerAnimated(animated: Bool) {
        navigationController?.popViewControllerAnimated(animated)
    }
    
    public func navigationPopToRootViewControllerAnimated(animated: Bool) {
        navigationController?.popToRootViewControllerAnimated(animated)
    }
    
    public func navigationPopToRootViewControllerAnimated(animated: Bool, closure: Void->Void) {
        navigationController?.popToRootViewControllerAnimated(animated)
        closure()
    }
    
    public func dismiss() {
        if (navigationController?.childViewControllers.first == self) {
            dismissViewControllerAnimated(true, completion: nil)
            UINavigationBar.appearance().translucent = false
        } else {
            navigationController?.popViewControllerAnimated(true)
        }
    }
}
