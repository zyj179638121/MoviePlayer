//
//  HotBannerScrollView.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

import HLPhotoRollPlayer

protocol BannerJumpDelegate:NSObjectProtocol {
    func bannerWillEnterNextPage(index:Int)
}


class HotBannerScrollView: UIView,UIScrollViewDelegate {


    
        var bannerArr: [XZHotADModel]?
    
        var delegate: BannerJumpDelegate?
        
        
        lazy var rollPlayerView: HLPhotoRollPlayerView = {
            var array: [UIView] = []
            for i in 1...self.bannerArr!.count {
                let button: UIButton = UIButton(frame: CGRectMake(0, 0, kScreenW, self.bounds.size.height))
                let bannerModel = self.bannerArr![i-1]
                button.kf_setImageWithURL(NSURL(string: bannerModel.imageUrl ?? "")!, forState: .Normal, placeholderImage: UIImage(named: "placeholderImage_banner"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                button.tag = i + 999
                button.addTarget(self, action: #selector(HotBannerScrollView.bannerClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                array.append(button)
            }
            
            let view = HLPhotoRollPlayerView(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height), viewArray: array)
            
            return view
        }()
        
        init(frame: CGRect, bannerData: Array<XZHotADModel>?) {
            super.init(frame: frame)
            bannerArr = bannerData
            rollPlayerView.isPageControlCenter = true
            addSubview(rollPlayerView)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HotBannerScrollView.setBannerTimer(_:)), name: "LKSetBannerTimer", object: nil)
        }
        
        func bannerClick(sender: UIButton) {
            self.delegate?.bannerWillEnterNextPage(sender.tag - 1000)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        deinit{
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
        
        func setBannerTimer(noti:NSNotification) {
            let result = noti.object as? Bool
            rollPlayerView.isTimerActive = result
            HLPrint("result = \(result)")
        }
        
    }


