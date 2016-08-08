//
//  XZHotLive.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import Foundation
import ObjectMapper

class XZHotLive: HLModelType {
    var code: String?
    var data: XZHotLiveModel?
    var msg: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        code    <-  map["code"]
        data    <-  map["data"]
        msg     <-  map["msg"]
    }
}

class XZHotLiveModel: HLModelType {
    
    var counts:Int?
    var list:[HotLiveDetail]?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        counts <- map["counts"]
        list   <- map["list"]
    }
}

class HotLiveDetail: HLModelType {
    
    var allnum:Int?
    var roomid:Int?
    var serverid:Int?
    var gps:String?
    var flv:String?
    var starlevel:Int?
    var useridx:Int?
    var userId:String?
    var gender:Int?
    var myname:String?
    var signatures:String?
    var smallpic:String?
    var bigpic:String?
    var level:Int?
    var grade:Int?
    var curexp:Int?
    
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        
        allnum         <- map["allnum"]
        roomid         <- map["roomid"]
        serverid       <- map["serverid"]
        gps            <- map["gps"]
        flv            <- map["flv"]
        starlevel      <- map["starlevel"]
        useridx        <- map["useridx"]
        userId         <- map["userId"]
        gender         <- map["gender"]
        myname         <- map["myname"]
        signatures     <- map["signatures"]
        smallpic       <- map["smallpic"]
        bigpic         <- map["bigpic"]
        level          <- map["level"]
        grade          <- map["grade"]
        curexp         <- map["curexp"]
    }
}
