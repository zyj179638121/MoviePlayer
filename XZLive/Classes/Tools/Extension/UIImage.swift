//
//  UIImage.swift
//  ShopClient
//
//  Created by 安跃超 on 16/5/5.
//  Copyright © 2016年 MYKJ. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
// UIImage
extension UIImage {
    /**
     从view上截图
     
     - returns: 截图图像
     */
    class func screenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(UIApplication.sharedApplication().keyWindow!.bounds.size, UIApplication.sharedApplication().keyWindow!.opaque, 0.0)
        UIApplication.sharedApplication().keyWindow!.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // 生成后的image
        return image
    }
    
    /**
     根据给定得图片，从其指定区域截取一张新得图片
     
     - parameter bigImage: 旧图
     - parameter rect:     尺寸
     
     - returns: 返回的新图像
     */
    class func getScreenshotFromImage(bigImage: UIImage, rect: CGRect) -> UIImage{
        //大图bigImage
        //定义myImageRect，截图的区域
        let imageRef = bigImage.CGImage
        let subImageRef = CGImageCreateWithImageInRect(imageRef, rect)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextDrawImage(context, rect, subImageRef)
        let smallImage = UIImage(CGImage: subImageRef!)
        UIGraphicsEndImageContext()
        return smallImage
    }
    
    /**
     根据尺寸设置图片大小
     
     - parameter newsize: 新的尺寸
     
     - returns: 返回UIImage对象
     */
    func scaleToSize(newSize: CGSize) -> UIImage {
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(newSize)
        // 绘制改变大小的图片
        drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        // 从当前context中创建一个改变大小后的图片
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        // 使当前的context出堆栈
        UIGraphicsEndImageContext()
        // 返回新的改变大小后的图片
        return scaledImage
    }
    
    /**
     根据比例缩放图片大小
     
     - parameter scale: 缩放比例
     
     - returns: 返回UIImage对象
     */
    func changeScale(scale: CGFloat) -> UIImage {
        let size = CGSizeMake(self.size.width * scale, self.size.height * scale)
        UIGraphicsBeginImageContext(size);
        // 绘制改变大小的图片
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        // 从当前context中创建一个改变大小后的图片
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        // 使当前的context出堆栈
        UIGraphicsEndImageContext()
        // 返回新的图片
        return scaledImage
    }
    
    class func thumbnailImageForVideo(videoURL: NSURL, atTime time: NSTimeInterval) -> UIImage? {
        let asset = AVURLAsset(URL: videoURL, options: nil)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        assetImageGenerator.appliesPreferredTrackTransform = true
        assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels
        var thumbnailImageRef: CGImageRef?
        let thumbnailImageTime = time
        do {
            thumbnailImageRef = try assetImageGenerator.copyCGImageAtTime(CMTimeMake(Int64(thumbnailImageTime), 1), actualTime: nil)
        } catch {
            HLPrint(error)
        }
        return (thumbnailImageRef != nil) ? UIImage(CGImage: thumbnailImageRef!) : nil
    }
    
    class func circleImage(originImage:UIImage,borderColor:UIColor,borderWidth:CGFloat) -> UIImage {
        //设置边框宽度
        let imageWH = originImage.size.width
        //计算外圆的尺寸
        let ovalWH = imageWH + 2 * borderWidth
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(originImage.size, false, 0)
        //画一个大的圆形
        let path = UIBezierPath.init(ovalInRect: CGRectMake(0, 0, ovalWH, ovalWH))
        borderColor.set()
        path.fill()
        //设置裁剪区域
        let clipPath = UIBezierPath.init(ovalInRect: CGRectMake(borderWidth, borderWidth, imageWH, imageWH))
        clipPath.addClip()
        //绘制图片
        originImage.drawAtPoint(CGPointMake(borderWidth, borderWidth))
        //从上下文中获取图片
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        return resultImage
    }
}
