//
//  XZMenuSelectView.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/29.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit
import SnapKit

class XZMenuSelectView: UIView {
    
    /// 下滑线
    var singleLine:UIView?
    
    var btnWidth: CGFloat?
    
    var clickBlock: (Int -> Void)?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
     init(frame: CGRect,titleArr:Array<String>) {
        super.init(frame: frame)
        HLPrint("frame = \(frame)")
        btnWidth = frame.size.width/2
        createSubviews(titleArr)
    }
    
    // 设置uibutton及line
    func createSubviews(item:Array<String>) {
        HLPrint("item = \(item)")
        for i in 0..<item.count {
            let btn = UIButton.init(type: .Custom)
            btn.frame = CGRectMake(btnWidth! * CGFloat(i), 0, btnWidth!, self.frame.size.height - 4)
            btn.setTitle(item[i], forState: .Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            btn.tag = 1000 + i
            btn.addTarget(self, action: #selector(self.btnClick(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(btn)

        }
        singleLine = UIView()
        singleLine?.frame = CGRectMake(0, self.frame.size.height-4, 70, 2)
        singleLine?.backgroundColor = UIColor.whiteColor()
        singleLine?.center.x = btnWidth!/2
        addSubview(singleLine!)
        self.layoutIfNeeded()
        
    }
    
    
    func btnClick(sender:UIButton) {
        HLPrint("sender tag = \(sender.titleLabel?.text)")
//        UIView.animateWithDuration(0.3) {
//            
//            self.singleLine?.center.x = self.btnWidth!/2 * CGFloat(2*(sender.tag-1000)+1)
//        }
        self.clickBlock?(sender.tag - 1000)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
