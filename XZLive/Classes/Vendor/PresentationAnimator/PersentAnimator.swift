//
//  PersentAnimation.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import UIKit

public class PersentAnimator: UIPercentDrivenInteractiveTransition {
    public enum UIPresentTransitionStyle {
        case CrossDissolve
        case CoverVertical
        case None
    }
    
    /// present样式
    /// CrossDissolve
    /// CrossDissolve
    public var presentStlye: UIPresentTransitionStyle = .None
    
    /// 动画时长
    public var animatingDuration: NSTimeInterval = 0.3
    
    private var isPersent = false
    
    private var shouldComplete: Bool = false
    
    private var interacting = false
    
    private weak var presentingVC: UIViewController?
    
    public static let sharedPersentAnimation = PersentAnimator()
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPersent = true
        return PersentAnimator.sharedPersentAnimation
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPersent = false
        return PersentAnimator.sharedPersentAnimation
    }
    
    func prepareGestureRecognizerInView(view: UIView) {
        let popRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action:#selector(PersentAnimator.handlePopRecognizer(_:)))
        popRecognizer.edges = .Left
        view.addGestureRecognizer(popRecognizer)
    }
    
    func handlePopRecognizer(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        
        let translation = gestureRecognizer.translationInView(gestureRecognizer.view?.superview)
        switch (gestureRecognizer.state) {
        case .Began:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            interacting = true
            presentingVC?.dismissViewControllerAnimated(true, completion:nil)
        case .Changed:
            // 2. Calculate the percentage of guesture
            var fraction = translation.x / UIApplication.sharedApplication().delegate!.window!!.bounds.width
            //Limit it between 0 and 1
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            shouldComplete = (fraction > CGFloat(animatingDuration))
            updateInteractiveTransition(fraction)

        case .Cancelled:
            // 3. Gesture over. Check if the transition should happen or not
            interacting = false
            if (!shouldComplete || gestureRecognizer.state == .Cancelled) {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
            
        case .Ended:
            interacting = false
            if (!shouldComplete || gestureRecognizer.state == .Cancelled) {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
            
        default: break
        }
    }
    
}

extension PersentAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animatingDuration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1. Get controllers from transition context
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) ?? UIViewController()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)  ?? UIViewController()
        toVC.view.layer.shadowPath = UIBezierPath(rect: toVC.view.bounds).CGPath
        toVC.view.layer.shadowColor = UIColor.blackColor().CGColor
        toVC.view.layer.shadowOffset = CGSizeMake(0, 0)
        toVC.view.layer.shadowOpacity = 0.5
        toVC.view.layer.shadowRadius = 5.0
        presentingVC = toVC
        if isPersent {
            prepareGestureRecognizerInView(toVC.view)
        }
        // 2. Set init frame for toVC
        let screenBounds = UIScreen.mainScreen().bounds
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        if presentStlye == .CoverVertical {
            if isPersent {
                toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0)
            } else {
                toVC.view.frame = CGRectOffset(finalFrame, -screenBounds.size.width/2, 0)
            }
        } else {
            if isPersent {
                toVC.view.alpha = 0
            } else {
                fromVC.view.alpha = 1
            }
        }
        
        // 3. Add toVC's view to containerView
        let containerView = transitionContext.containerView() ?? UIView()
        containerView.addSubview(toVC.view)
        if !isPersent {
            containerView.bringSubviewToFront(fromVC.view)
        }
        // 4. Do animate now
        switch presentStlye {
        case .CoverVertical:
            UIView.animateWithDuration(animatingDuration, animations: {
                if self.isPersent {
                    fromVC.view.frame = CGRectMake(-screenBounds.size.width / 2, fromVC.view.y, fromVC.view.width, fromVC.view.height)
                } else {
                    fromVC.view.frame = CGRectMake(screenBounds.size.width, fromVC.view.y, fromVC.view.width, fromVC.view.height)
                }
                toVC.view.frame = finalFrame
            }) { _ in
                    if self.isPersent {
                        transitionContext.completeTransition(true)
                    } else {
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    }
            }
        case .CrossDissolve:
            UIView.animateWithDuration(animatingDuration, animations: {
                if self.isPersent {
                    toVC.view.alpha = 1
                } else {
                    fromVC.view.alpha = 0
                }
            }) { _ in
                if self.isPersent {
                    transitionContext.completeTransition(true)
                }else {
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                }
            }
        default: break
        }
    }
}

extension PersentAnimator: UIViewControllerTransitioningDelegate {
    public func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interacting ? self : nil
    }
}