//
//  HLModelType.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import ObjectMapper

import CryptoSwift
import ObjectMapper

/// MARK: - 必须实现的代理方法
protocol HLModelType: Mappable { }

extension HLModelType {
    /// MARK: - 归档路径
    static func filePath(fid: String?) -> String {
        let basePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!.stringByAppendingString("/\(NSBundle.mainBundle().infoDictionary!["CFBundleIdentifier"] as! String)/Coding/")
        
        let baseURL = NSURL(fileURLWithPath: basePath)
        if FileExistsAtURL(baseURL, isDirectory: true) == false {
            FileCreateAtURL(baseURL, isDirectory: true)
        }
        let fileName = "\(self.dynamicType)".md5() + "\(fid ?? "").arc"
        return basePath.stringByAppendingString(fileName)
    }
    
    /// MARK: - 归档方法
    func encode(fid: String? = nil) {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(self.toJSON(), forKey: "data")
        archiver.finishEncoding()
        let cryptoData = data.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
        NSKeyedArchiver.archiveRootObject(cryptoData, toFile: Self.filePath(fid))
    }
    
    /// MARK: - 解档方法
    static func decode(fid: String? = nil) -> Self? {
        if let data = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(fid)) as? NSData {
            let encrytoData = NSData(base64EncodedData: data, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: encrytoData!)
            let dict = unarchiver.decodeObjectForKey("data") as? [String: AnyObject]
            unarchiver.finishDecoding()
            let model = self.init(JSON: dict!)
            return model
        } else {
            return nil
        }
    }
    
    /// MARK: - 模型映射属性转换
    var StrToInt: TransformOf<Int, String> {
        get {
            return TransformOf<Int, String>(fromJSON: { Int($0 ?? "") }, toJSON: { $0.map { String($0) } })
        }
    }
    
    var StrToFloat: TransformOf<Float, String> {
        get {
            return TransformOf<Float, String>(fromJSON: { Float($0 ?? "") }, toJSON: { $0.map { String($0) } })
        }
    }
    
    var StrToDouble: TransformOf<Double, String> {
        get {
            return TransformOf<Double, String>(fromJSON: { Double($0 ?? "") }, toJSON: { $0.map { String($0) } })
        }
    }
    
    
}

extension Map {
    subscript(trans: TransformOf<Int, String>) -> (Map, TransformOf<Int, String>) {
        return (self, trans)
    }
    
    subscript(trans: TransformOf<Float, String>) -> (Map, TransformOf<Float, String>) {
        return (self, trans)
    }
    
    subscript(trans: TransformOf<Double, String>) -> (Map, TransformOf<Double, String>) {
        return (self, trans)
    }
    
    subscript(trans: TransformOf<String, String>) -> (Map, TransformOf<String, String>) {
        return (self, trans)
    }
}