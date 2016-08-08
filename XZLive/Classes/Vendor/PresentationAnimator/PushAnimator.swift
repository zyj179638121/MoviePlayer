//
//  PushAnimationDelegate.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import UIKit

public class PushAnimator: NSObject {
    
    /// 动画时长
    public var animatingDuration: NSTimeInterval = 0.3
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    private weak var navigationController: UINavigationController?
    
    private var isPush = false
    
    private var shouldComplete = false
    
    private var interacting = false
    
    private func prepareGestureRecognizerInView(view: UIView) {
        let popRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(PushAnimator.handlePopRecognizer(_:)))
        popRecognizer.edges = UIRectEdge.Left
        view.addGestureRecognizer(popRecognizer)
    }
    
    @objc private func handlePopRecognizer(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        let translation = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        switch (gestureRecognizer.state) {
        case .Began:
            self.interactionController = UIPercentDrivenInteractiveTransition()
            self.navigationController!.popViewControllerAnimated(true)
        case .Changed:
            var fraction = translation.x / UIApplication.sharedApplication().delegate!.window!!.frame.size.width
            //Limit it between 0 and 1
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            shouldComplete = (fraction > CGFloat(animatingDuration))
            interactionController!.updateInteractiveTransition(fraction)
        case .Ended:
            // 3. Gesture over. Check if the transition should happen or not
            interacting = false
            if !shouldComplete || gestureRecognizer.state == .Cancelled {
                interactionController!.cancelInteractiveTransition()
            } else {
                interactionController!.finishInteractiveTransition()
            }
            interactionController = nil
        case .Cancelled:
            // 3. Gesture over. Check if the transition should happen or not
            interacting = false
            if !shouldComplete || gestureRecognizer.state == .Cancelled {
                interactionController!.cancelInteractiveTransition()
            } else {
                interactionController!.finishInteractiveTransition()
            }
            interactionController = nil
        default: break
        }
    }
}

extension PushAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animatingDuration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1. Get controllers from transition context
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) ?? UIViewController()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) ?? UIViewController()
        
        if isPush {
            prepareGestureRecognizerInView(toVC.view)
        }
        
        // 2. Set init frame for toVC
        let screenBounds = UIScreen.mainScreen().bounds
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        if self.isPush {
            toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0)
        } else {
            toVC.view.frame = CGRectOffset(finalFrame, -screenBounds.size.width, 0)
        }
        
        // 3. Add toVC's view to containerView
        let containerView = transitionContext.containerView() ?? UIView()
        containerView.addSubview(toVC.view)
        if !isPush {
            containerView.bringSubviewToFront(fromVC.view)
        }
        // 4. Do animate now
        UIView.animateWithDuration(animatingDuration, animations: {
            if self.isPush {
                fromVC.view.frame = CGRectMake(-screenBounds.size.width, fromVC.view.frame.origin.y, fromVC.view.frame.size.width, fromVC.view.frame.size.height)
            } else {
                fromVC.view.frame = CGRectMake(screenBounds.size.width, fromVC.view.frame.origin.y, fromVC.view.frame.size.width, fromVC.view.frame.size.height)
            }
            toVC.view.frame = finalFrame
            
        }) { _ in
            if self.isPush {
                transitionContext.completeTransition(true)
            } else {
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        }
    }
}

extension PushAnimator: UINavigationControllerDelegate {
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.navigationController = navigationController
        if operation == UINavigationControllerOperation.Push {
            isPush = true
            return self
        } else if operation == UINavigationControllerOperation.Pop {
            isPush = false
            return self
        }
        return nil
    }
    
    public func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
}