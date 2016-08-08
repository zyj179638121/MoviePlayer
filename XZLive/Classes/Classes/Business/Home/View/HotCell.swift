//
//  HotCell.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit
import Kingfisher

class HotCell: UICollectionViewCell {
    
    @IBOutlet weak var headPic: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var watchNum: UILabel!
    
    @IBOutlet weak var descImage: UIImageView!
    
    @IBOutlet weak var isLiveImage: UIImageView!
    
    var model:HotLiveDetail?{
        didSet{
            HLPrint("nameLabel = \(nameLabel.text ?? "")")
            nameLabel.text = model?.myname ?? ""
            locationBtn.setTitle(model?.gps ?? "喵星", forState: .Normal)
            
            headPic.kf_setImageWithURL(NSURL(string: model?.smallpic ?? ""))
            descImage.kf_setImageWithURL(NSURL(string: model?.bigpic ?? ""))
        }
    }
}
