//
//  HomeViewController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/22.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var scrollView:UIScrollView = {
        let a = UIScrollView.init(frame: CGRectMake(0, 0, kScreenW, kScreenH-49-64))
        a.contentSize = CGSizeMake(kScreenW*2, 0)
        a.backgroundColor = UIColor.whiteColor()
        a.showsVerticalScrollIndicator = false
        a.showsHorizontalScrollIndicator = false
        a.pagingEnabled = true
        a.delegate = self
        a.bounces = false
        return a
    
    }()
    
    lazy var hotVC = SB_Hot.initialVC as! HotViewController
    
    lazy var newVC = SB_New.initialVC as! NewViewController
    
    lazy var topMenu:XZMenuSelectView = {
      let a = XZMenuSelectView.init(frame: (self.navigationController?.navigationBar.bounds)!, titleArr: ["最热","最新"])
        return a
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setSubViewAndChildVC()

    }
    
    func rightTestCollectionView() {
        let newVC = SB_New.initialVC as! NewViewController
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func leftTestCollectionView() {
        let hotVC = SB_Hot.initialVC as! HotViewController
        navigationController?.pushViewController(hotVC, animated: true)
    }
    
    func setSubViewAndChildVC() {
        
        /// childVC
        let height = kScreenH - 49 - 64
        hotVC.view.frame = CGRectMake(0, 0, kScreenW, height)
        addChildViewController(hotVC)
        scrollView.addSubview(hotVC.view)
        
        newVC.view.frame = CGRectMake(kScreenW, 0, kScreenW, height)
        addChildViewController(newVC)
        scrollView.addSubview(newVC.view)
        view.addSubview(scrollView)
        
        /// topView

        topMenu.clickBlock = {
            
            HLPrint("num = \($0)")
            let num = $0 
            self.scrollView.setContentOffset(CGPointMake(kScreenW*CGFloat(num), 0), animated: true)
        }
//        self.navigationController?.navigationBar.addSubview(topMenu)
        self.navigationItem.titleView = topMenu
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

extension HomeViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offSetX = scrollView.contentOffset.x / kScreenW * (topMenu.frame.size.width/2) + 60
        topMenu.singleLine?.x = offSetX
    }
}
