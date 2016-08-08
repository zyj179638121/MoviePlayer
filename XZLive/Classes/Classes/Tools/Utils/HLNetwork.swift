//
//  HLNetwork.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/17.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import Alamofire

class HLNetworkTool: NSObject,NSURLSessionTaskDelegate {
    class func UploadWithPOST(URLString: URLStringConvertible,
                              headers: [String: String]? = nil,
                              multipartFormData: MultipartFormData -> Void,
                              encodingMemoryThreshold: UInt64 = Manager.MultipartFormDataEncodingMemoryThreshold,
                              encodingCompletion: (Manager.MultipartFormDataEncodingResult -> Void)?) {
        
        Alamofire.upload(.POST, URLString, headers: headers, multipartFormData: multipartFormData, encodingMemoryThreshold: encodingMemoryThreshold, encodingCompletion: encodingCompletion)
    }  
}



