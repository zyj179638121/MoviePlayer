//
//  HotSectionView.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

class HotSectionView: UICollectionReusableView {
    
    var bannerScrollView : HotBannerScrollView?
    
    var bannerArr: [XZHotADModel]? {
        didSet {
            if bannerScrollView == nil && bannerArr != nil {
                layoutIfNeeded()
                bannerScrollView = HotBannerScrollView(frame: self.bounds, bannerData: bannerArr)
                self.addSubview(bannerScrollView!)
            }
        }
    }
}
