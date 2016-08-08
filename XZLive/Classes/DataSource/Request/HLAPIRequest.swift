//
//  HLAPIRequest.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

extension Request {
    func toLKAPIRequest() -> HLAPIRequest {
        return HLAPIRequest(request: self)
    }
}

class HLAPIRequest {
    let request: Request
    
    /// MARK: - 请求状态枚举
    enum RequestStatusType {
        case Succeed, Failed, Unknown
    }
    
    init(request: Request) { self.request = request }
    
    /// MARK: - 请求缓存方法
    private func requestCache() -> Request {
        return request.response { request, response, data, error in
            if let res = response {
                let cachedURLResponse = NSCachedURLResponse(response: res, data: data!, userInfo: nil, storagePolicy: .Allowed)
                NSURLCache.sharedURLCache().storeCachedResponse(cachedURLResponse, forRequest: request!)
            }
        }
    }
    
    /// MARK: - debug调试
    func Debug(completionHandler: ((request: String, response: String, data: String, error: String) -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().response { (request, response, data, error) in
            HLNetworkIndicator(false)
            
            let dataStr = NSString(data: data ?? NSData(), encoding: NSUTF8StringEncoding) as! String
            completionHandler(request: request.debugDescription,
                response: response.debugDescription,
                data: dataStr,
                error: error.debugDescription)
        }
        return self
    }
    
    /// MARK: - 将数据作为JSON解析，闭包内返回JSON内的note字段,String类型
    func Info(completionHandler: ((note: String, status: RequestStatusType) -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let result = $0.result.value as? [String: AnyObject] {
                let note = result["note"] as? String ?? "null"
                let statusCode = (result["status"] as? Int) ?? 0
                var status: RequestStatusType?
                switch statusCode {
                case 0: status = .Failed
                case 1: status = .Succeed
                default: status = .Unknown
                }
                completionHandler(note: note, status: status ?? .Failed)
            }
        }
        return self
    }
    
    /// MARK: - 将数据作为JSON解析，闭包内返回JSON内的note字段,String类型;status字段, RequestStatusType类型
    func Note(completionHandler: (String -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let result = $0.result.value as? [String: AnyObject] {
                if let note = result["note"] as? String {
                    completionHandler(note)
                }
            }
        }
        return self
    }
    
    /// MARK: - 将数据作为JSON解析，闭包内返回JSON内的status字段, RequestStatusType类型
    func Status(completionHandler: (RequestStatusType -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let result = $0.result.value as? [String: AnyObject] {
                if let status = result["status"] as? Int {
                    switch status {
                    case 0: completionHandler(.Failed)
                    case 1: completionHandler(.Succeed)
                    default: completionHandler(.Unknown)
                    }
                }
            }
        }
        return self
    }
    
    /// MARK: - 将数据作为字符串解析，闭包内返回String类型
    func StringType(completionHandler: String -> Void) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseString {
            HLNetworkIndicator(false)
            if let data = $0.data {
                if let string = NSString(data: data, encoding: NSUTF8StringEncoding) as? String {
                    completionHandler(string)
                }
            }
        }
        return self
    }
    
    /// MARK: - 将数据作为JSON解析，闭包内返回SwiftyJSON类型
    func JSON(completionHandler: (SwiftyJSON.JSON -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let result = $0.result.value as? [String: AnyObject] {
                completionHandler(SwiftyJSON.JSON(result))
            }
        }
        return self
    }
    
    /// MARK: - 将数据作为Model解析，闭包内返回LKModelType协议类型
    func Model<T: HLModelType>(completionHandler: (T -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let result = $0.result.value as? [String: AnyObject] {
                completionHandler(T(JSON: result)!)
            } else {
                HLProgressHUD.Error.Network.show
            }
        }
        return self
    }
    
    /// MARK: - 网络请求失败，闭包内返回ErrorType
    func Failed(completionHandler: (ErrorType -> Void)) -> Self {
        HLNetworkIndicator(true)
        requestCache().responseJSON {
            HLNetworkIndicator(false)
            if let error = $0.result.error {
                debugPrint("\(error.localizedDescription)")
                completionHandler(error)
            }
        }
        return self
    }
}