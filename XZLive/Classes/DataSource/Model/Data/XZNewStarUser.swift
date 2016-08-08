//
//  XZNewStarUser.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import Foundation
import ObjectMapper

class XZNewStarUser: HLModelType {
    var code: String?
    var data: XZStarUserModel?
    var msg: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        code  <-  map["code"]
        data    <-  map["data"]
        msg    <-  map["msg"]
    }
}

class XZStarUserModel: HLModelType {
    var totalPage: Int?
    var list:[XZStarUserDetail]?
    
    required init?(_ map: Map) { }

    func mapping(map: Map) {
        totalPage  <-  map["totalPage"]
        list    <-  map["list"]
    }
}

class XZStarUserDetail: HLModelType {
    
    var nickname:String?
    var photo:String?
    var sex:Int?
    var starlevel:Int?
    var allnum:Int?
    var new:Int?
    var roomid:Int?
    var useridx:Int?
    var flv:String?
    var serverid:Int?
    var position:String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        nickname  <-  map["nickname"]
        photo     <-  map["photo"]
        sex       <-  map["sex"]
        starlevel <-  map["starlevel"]
        allnum    <-  map["allnum"]
        new       <-  map["new"]
        roomid    <-  map["roomid"]
        useridx   <-  map["useridx"]
        flv       <-  map["flv"]
        serverid  <-  map["serverid"]
        position  <-  map["position"]
    }
}
