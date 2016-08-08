//
//  UILabel.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

// UILabel
extension UILabel {
    
    convenience init(color: UIColor, fontSize: CGFloat, mutiLines: Bool = false) {
        self.init()
        
        font = UIFont.systemFontOfSize(fontSize)
        textColor = color
        
        if mutiLines {
            numberOfLines = 0
        }
    }
    
    func boundingRectWithSize(size: CGSize) -> CGSize {
        let attribute = [NSFontAttributeName: self.font]
        
        let retSize = (self.text! as NSString).boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attribute, context: nil).size
        
        return retSize
    }
}