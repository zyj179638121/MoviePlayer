//
//  LiveDetailController.swift
//  XZDouyu
//
//  Created by MYKJ on 16/8/2.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

import UIKit
import IJKMediaFramework

class LiveDetailController: BaseViewController {
    
    var titleStr:String?
    
    var flv:String?{
        didSet{
//            setupMoviePlayer(flv ?? "")
        }
    }
    
    var moviePlayer:IJKFFMoviePlayerController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = titleStr ?? ""
        
        setupMoviePlayer(flv ?? "")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "X", style: .Done, target: self, action: #selector(self.back))
    }
    
    func back() {
        self.moviePlayer?.shutdown()
        dismissViewControllerAnimated(true) { 
            
        }
    }
    
    /// 播放器
    func setupMoviePlayer(flv:String) {
        HLPrint("flv = \(flv)")
        
        HLProgressHUD.Loading.Loading.show
        
        let options = IJKFFOptions.optionsByDefault()
        options.setPlayerOptionIntValue(1, forKey: "videotoolbox")
        options.setPlayerOptionIntValue(Int64(29.97), forKey: "r")
        options.setPlayerOptionIntValue(512, forKey: "vol")
        
        moviePlayer = IJKFFMoviePlayerController.init(contentURLString: flv, withOptions: options)
        moviePlayer?.view.frame = view.bounds
        moviePlayer?.scalingMode = .AspectFill
        moviePlayer?.shouldAutoplay = false
        moviePlayer?.shouldShowHudView = false
        view.addSubview(moviePlayer!.view)
        moviePlayer?.prepareToPlay()
        
        setNotification()
    }
    
    func setNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.didFinish), name: IJKMPMoviePlayerPlaybackDidFinishNotification, object: self.moviePlayer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.stateDidChange), name: IJKMPMoviePlayerLoadStateDidChangeNotification, object: self.moviePlayer)
    }
    
    func didFinish() {
        self.moviePlayer?.play()
    }
    
    func stateDidChange() {
//        if self.moviePlayer?.loadState == .PlaythroughOK{
        HLProgressHUD.dismiss
            self.moviePlayer?.play()
//        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
