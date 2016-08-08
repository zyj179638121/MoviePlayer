//
//  Then.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation

public protocol Then {}

extension Then {
    func then(closure: Self -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Then {}

//extension UIView: Then {}
//
//extension UIViewController: Then {}