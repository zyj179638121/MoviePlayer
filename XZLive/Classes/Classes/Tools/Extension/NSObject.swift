//
//  NSObject.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation

extension NSObject {
    func memoize<T: Hashable, U>( body: (T)->U ) -> (T->U) {
        var memo = Dictionary<T, U>()
        return { x in
            if let q = memo[x] { return q }
            let r = body(x)
            memo[x] = r
            return r
        }
    }
}

/// 禁止使用print
public func print(items: Any...) { }