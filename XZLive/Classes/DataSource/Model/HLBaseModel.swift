//
//  HLBaseModel.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import ObjectMapper


class HLBaseModel: HLModelType {
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) { }
}