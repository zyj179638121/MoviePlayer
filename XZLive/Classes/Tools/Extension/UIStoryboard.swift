//
//  UIStoryboard.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    /// 等同于instantiateInitialViewController()
    var initialVC: UIViewController? {
        get {
            return instantiateInitialViewController()
        }
    }
}