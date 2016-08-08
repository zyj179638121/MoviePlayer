//
//  HotViewController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/7/28.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit

private let reuseIdentifier = "hot"


class HotViewController: BaseCollectionViewController {
    
    
    var adModel:XZHotAD?
    
    var hotLiveModel:XZHotLive?{
        didSet{
//            collectionView?.reloadData()
            totalPage = hotLiveModel?.data?.counts
        }
    }
    
    var currentPage = 1
    
    var totalPage:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.mj_header.beginRefreshing()
        collectionView?.mj_footer.hidden = true
        
    }
    
    override func loadNewData() {
        currentPage = 1
        loadADData()
    }
    
    override func loadMoreData() {
        self.currentPage += 1
        if currentPage > totalPage! {
            collectionView?.mj_footer.endRefreshingWithNoMoreData()
            currentPage -= 1
            return
        }
        loadLiveData()
    }
    
    
    func loadADData() {
        HLAPI.Extra.Custom(.GET, "http://live.9158.com/Living/GetAD").requestAPI().Model { (result:XZHotAD) in
            self.adModel = result
            self.loadLiveData()
        }
    }
    
    func loadLiveData() {
        HLAPI.Extra.Custom(.GET, "http://live.9158.com/Fans/GetHotLive?").requestAPI(["page":currentPage]).Model { (result:XZHotLive) in
            
            if self.currentPage == 1{
                self.hotLiveModel = result
                self.collectionView?.mj_footer.hidden = false
                self.collectionView?.mj_footer.resetNoMoreData()
                self.collectionView?.mj_header.endRefreshing()

            }else{
                result.data?.list?.forEach({
                    self.hotLiveModel?.data?.list?.append($0)
                })
                self.collectionView?.mj_footer.endRefreshing()
            }
            self.collectionView?.reloadData()

//            self.collectionView?.mj_header.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return self.hotLiveModel?.data?.list?.count ?? 0
        }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HotCell
    
            // Configure the cell
        
            let liveDetailModel = self.hotLiveModel?.data?.list?[indexPath.row]
            cell.model = liveDetailModel
            return cell
        }
    
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "hotSection", forIndexPath: indexPath) as! HotSectionView
        header.bannerArr = self.adModel?.data
        header.bannerScrollView?.delegate = self
        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(kScreenW, 465)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        HLPrint("row = \(indexPath.row)")
        let currentModel = self.hotLiveModel!.data!.list![indexPath.row]
        let nv = SB_LiveDetail.initialVC as! BaseNavigationController
        (nv.topViewController as! LiveDetailController).flv = currentModel.flv
        (nv.topViewController as! LiveDetailController).titleStr = currentModel.myname
        presentPushEffect(nv) {
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    NSNotificationCenter.defaultCenter().postNotificationName("LKSetBannerTimer", object: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    NSNotificationCenter.defaultCenter().postNotificationName("LKSetBannerTimer", object: false)
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

extension HotViewController:BannerJumpDelegate{
    func bannerWillEnterNextPage(index: Int) {
        HLPrint("index = \(index)")
    }
}
