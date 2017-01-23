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
    
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var activityLoader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLoader.isHidden = true
        textField.text = "https://www.youtube.com/watch?v=X7FVYJ6ONXk"
    }

    @IBAction func getVideoLink(sender : UIButton)
    {
        self.view.endEditing(true)
        
        guard self.textField.text!.isEmpty == false else {
            let alert = UIAlertController(title: "Alert", message: "Link Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        activityLoader.startAnimating()
        activityLoader.isHidden = false
        
        let youtubeManager : YoutubeVideoManager = YoutubeVideoManager(url: self.textField.text!)
        
        youtubeManager.fetchVideoLink(completion: { (link : String, error : NSError?) in
            
            DispatchQueue.main.sync {
               self.textView.text = link
               self.activityLoader.isHidden = true
               self.activityLoader.stopAnimating()
            }
            
        })
    }
}
