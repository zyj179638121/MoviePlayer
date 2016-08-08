//
//  BaseNavigationController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/22.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    
    
    func setupNavigationBar() {
        
        // 取消navigationbar的透明效果
        navigationBar.translucent = false
        // 设置navigationbar的主题色
        navigationBar.tintColor = UIColor.whiteColor()
        // 设置navigationbar标题的颜色
        navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont.boldSystemFontOfSize(18)]
        navigationBar.barTintColor = HLColor("DD2E7A")
        
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
