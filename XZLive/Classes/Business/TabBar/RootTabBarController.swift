//
//  RootTabBarController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/22.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupChildVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 设置子控制器
    func setupChildVC() {
        
        tabBar.tintColor = HLColor("DD2E7A")
        
        let homeVC = SB_Home.instantiateInitialViewController()!
        let myCenterVC = SB_MyCenter.instantiateInitialViewController()!
        let childVC = [homeVC,myCenterVC]
        setViewControllers(childVC, animated: true)
        
        let names = ["首页","我的"]
        let normalImages = [UIImage(named: "toolbar_home"),UIImage(named: "toolbar_me")]
        let selectImages = [UIImage(named: "toolbar_home_sel"),UIImage(named: "toolbar_me_sel")]
        for i in 0..<childVC.count {
            debugPrint(self.tabBar.items)
            let item = self.tabBar.items![i]
            item.title = names[i]
            item.image = normalImages[i]
            item.selectedImage = selectImages[i]
        }
        
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
