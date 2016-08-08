//
//  NewViewController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

private let reuseIdentifier = "new"

class NewViewController: BaseCollectionViewController {
    
    var model:XZNewStarUser?{
        didSet{
//            collectionView?.reloadData()
            totalPage = model?.data?.totalPage
        }
    }
    
    var totalPage:Int?
    
    var currentPage:Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView?.mj_header.beginRefreshing()
        collectionView?.mj_footer.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func loadNewData() {
        currentPage = 1
        loadData()
    }
    
    override func loadMoreData() {
        currentPage += 1
        if currentPage > totalPage! {
            collectionView?.mj_footer.endRefreshingWithNoMoreData()
            currentPage -= 1
            return
        }
        loadData()
        
    }
    
    
    func loadData() {
        HLAPI.Extra.Custom(.GET, "http://live.9158.com/Room/GetNewRoomOnline?").requestAPI(["page":self.currentPage]).Model { (result:XZNewStarUser) in
            if self.currentPage == 1{
                
                self.model = result
                self.collectionView?.mj_footer.hidden = false
                self.collectionView?.mj_footer.resetNoMoreData()

                self.collectionView?.mj_header.endRefreshing()
            }else{
                result.data?.list?.forEach({
                    self.model?.data?.list?.append($0)
                })
                self.collectionView?.mj_footer.endRefreshing()
            }
            self.collectionView?.reloadData()

        }
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return model?.data?.list?.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NewCell
        
        // Configure the cell
        let userDetail = model?.data?.list?[indexPath.row]
        cell.model = userDetail
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let itemWidth = kScreenW/3
        return CGSizeMake(itemWidth, itemWidth)
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        HLPrint("indexPathRow = \(indexPath.row)")
        let currentModel = self.model!.data!.list![indexPath.row]
        let nv = SB_LiveDetail.initialVC as! BaseNavigationController
        (nv.topViewController as! LiveDetailController).flv = currentModel.flv
        (nv.topViewController as! LiveDetailController).titleStr = currentModel.nickname
        presentPushEffect(nv) { 
            
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
