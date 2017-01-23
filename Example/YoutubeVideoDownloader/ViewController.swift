//
//  ViewController.swift
//  YoutubeVideoDownloader
//
//  Created by MOHAMED ARRADI-ALAOUI on 22/01/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import YoutubeVideoDownloader

class ViewController : UIViewController {
    
    @IBOutlet weak var webView : UIWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let youtubeManager : YoutubeVideoManager
        
         youtubeManager = YoutubeVideoManager(url: "https://www.youtube.com/watch?v=RDTxeY7akNA")
         
         youtubeManager.fetchVideoLink(completion: { (link : String, error : NSError?) in
        self.webView.loadRequest(URLRequest(url: URL(string: link)!))
            
         })
    }
}
