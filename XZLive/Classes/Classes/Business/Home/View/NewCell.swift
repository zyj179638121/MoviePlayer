//
//  NewCell.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit
import Kingfisher

class NewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var descImage: UIImageView!
    
    @IBOutlet weak var isNewImage: UIImageView!
    
    @IBOutlet weak var liveName: UILabel!
    
    var model:XZStarUserDetail?{
        didSet{
            HLPrint("name = \(model?.nickname ?? "")")
            liveName.text = model?.nickname ?? ""
            locationBtn.titleLabel?.text = model?.position ?? ""
            let imageURL = NSURL(string: model?.photo ?? "")
            descImage.kf_setImageWithURL(imageURL, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            
        }
    }
}
