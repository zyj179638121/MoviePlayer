//
//  XZRefreshHeader.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/29.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import Foundation
import MJRefresh

class XZRefreshHeader: MJRefreshGifHeader {
    init() {
        super.init(frame: .zero)
        self.lastUpdatedTimeLabel.hidden = true
        self.stateLabel.hidden = true
        self.setImages([UIImage(named: "reflesh1_60x55")!,UIImage(named: "reflesh2_60x55")!,UIImage(named: "reflesh3_60x55")!], forState: .Refreshing)
        self.setImages([UIImage(named: "reflesh1_60x55")!,UIImage(named: "reflesh2_60x55")!,UIImage(named: "reflesh3_60x55")!], forState: .Pulling)
        self.setImages([UIImage(named: "reflesh1_60x55")!,UIImage(named: "reflesh2_60x55")!,UIImage(named: "reflesh3_60x55")!], forState: .Idle)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}