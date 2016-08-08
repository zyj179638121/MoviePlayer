//
//  HLProgressHUD.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import UIKit
import SVProgressHUD

class HLProgressHUD {
    
    enum Error {
        case Custom(String)
        case Network
        ///  "评论内容不能小于4个字符！"
        case CommentInfoLess
        /// "您已回复该评论！不可重复评论！"
        case DontRepeatedComments
        /// 您已点过赞啦！
        case DontRepeatPrise
        
        var show: Void {
            
            var state: String?
            
            switch self {
            case .Custom(let string): state = string
            case .Network: state = sNetError
            case .CommentInfoLess: state = sInfoLessError
            case .DontRepeatedComments: state = sDontRepeatedComments
            case .DontRepeatPrise: state = sDontRepeatPrise
            }
            SVProgressHUD.setDefaultMaskType(.Black)
            SVProgressHUD.showErrorWithStatus(state)
            dispatch_after(1.5) { SVProgressHUD.dismiss() }
        }
    }
    
    enum Success {
        case Custom(String)
        case JoinDownloadQueue
        case Save
        case Mix
        case Prise
        case CancelCollect
        case Collected
        
        var show: Void {
            
            var state: String?
            
            switch self {
            case .Custom(let string): state = string
            case .JoinDownloadQueue: state = sJoinDownloadQueue
            case .Save: state = sSaveSuccess
            case .Mix: state = sMixedSuccess
            case .Prise: state = sPriseSuccess
            case .CancelCollect: state = sCancelCollect
            case .Collected: state = sCollected
            }
            SVProgressHUD.showSuccessWithStatus(state)
            dispatch_after(1.5) { SVProgressHUD.dismiss() }
        }
    }
    
    enum Loading {
        case Custom(String)
        case Mixing
        case Loading
        
        var show: Void {
            
            var state: String?
            
            switch self {
            case .Custom(let string): state = string
            case .Mixing: state = sMixing
            case .Loading: state = sLoading
            }
            SVProgressHUD.showWithStatus(state)
        }
    }
    
    enum Info {
        case Custom(String)
        
        var show: Void {
            
            var state: String?
            
            switch self {
            case .Custom(let string): state = string
            }
            SVProgressHUD.showInfoWithStatus(state)
            dispatch_after(1.5) { SVProgressHUD.dismiss() }
        }
    }
    
    class var dismiss: Void {
        SVProgressHUD.dismiss()
    }
}
