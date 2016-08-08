//
//  HLPublicMethods.swift
//  ShopClient
//
//  Created by MYKJ on 16/5/4.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import UIKit

public func FileCreateAtURL(url: NSURL, isDirectory: Bool = false) {
    if FileExistsAtURL(url, isDirectory: isDirectory) == false {
        if isDirectory {
            do {
                try HLFileManager.createDirectoryAtURL(url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                debugPrint(error)
            }
        } else {
            HLFileManager.createFileAtPath(FileURLToPath(url), contents: nil, attributes: nil)
        }
    }
}

/// 判断该文件路径是否存在
public func FileExistsAtURL(url: NSURL, isDirectory: Bool = false) -> Bool {
    let index = url.absoluteString.startIndex.advancedBy(7)
    let path = url.absoluteString.substringFromIndex(index)
    var isTrue = ObjCBool(isDirectory)
    return HLFileManager.fileExistsAtPath(path, isDirectory: &isTrue)
}

/// 从该文件路径删除该文件
public func FileRemoveAtURL(url: NSURL) -> ErrorType?{
    if FileExistsAtURL(url) {
        do {
            try HLFileManager.removeItemAtURL(url)
        } catch {
            return error
        }
    }
    return nil
}

/// 文件URL转为String
public func FileURLToPath(url: NSURL) -> String {
    let index = url.absoluteString.startIndex.advancedBy(7)
    return url.absoluteString.substringFromIndex(index)
}

/// LKNetworkIndicator
public func HLNetworkIndicator(isAnimating: Bool) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = isAnimating
}

/// 计算文字高度
public func HLTextHeight(text:NSString,width:CGFloat,fontSize:CGFloat) -> CGFloat {
    let size = CGSizeMake(width, 10000)


    let style = NSMutableParagraphStyle()
    style.lineSpacing = 15
    let rect = text.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18),NSParagraphStyleAttributeName:style], context: nil)
    
    return rect.size.height
}


/// 改变导航栏的颜色

public func changeNavigationBarColor(navigationController:UINavigationController,root:Bool) {
    if root {
        navigationController.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(18)]
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = HLColor("FF8400")
    }else{
        navigationController.navigationBar.tintColor = HLColor("FF8400")
        navigationController.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(18)]
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = UIColor.whiteColor()
    }
}

