//
//  XZHotAD.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import Foundation
import ObjectMapper

class XZHotAD: HLModelType {
    var code: String?
    var data: [XZHotADModel]?
    var msg: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        code  <-  map["code"]
        data    <-  map["data"]
        msg    <-  map["msg"]
    }
}

class XZHotADModel: HLModelType {
    var lrCurrent:Int?
    var serverid:Int?
    var myname:String?
    var signatures:String?
    var smallpic:String?
    var bigpic:String?
    var useridx:Int?
    var hiddenVer:Int?
    var cutTime:Int?
    var adsmallpic:String?
    var contents:String?
    var title:String?
    var imageUrl:String?
    var link:String?
    var roomid:Int?
    var addTime:String?
    var state:Int?
    var orderid:Int?
    
    required init?(_ map: Map) { }

    func mapping(map: Map) {
        lrCurrent     <- map["lrCurrent"]
        serverid      <- map["serverid"]
        myname        <- map["myname"]
        signatures    <- map["signatures"]
        smallpic      <- map["smallpic"]
        bigpic        <- map["bigpic"]
        useridx       <- map["useridx"]
        hiddenVer     <- map["hiddenVer"]
        cutTime       <- map["cutTime"]
        adsmallpic    <- map["adsmallpic"]
        contents      <- map["contents"]
        title         <- map["title"]
        imageUrl      <- map["imageUrl"]
        link          <- map["link"]
        roomid        <- map["roomid"]
        addTime       <- map["addTime"]
        state         <- map["state"]
        orderid       <- map["orderid"]
    }
}
