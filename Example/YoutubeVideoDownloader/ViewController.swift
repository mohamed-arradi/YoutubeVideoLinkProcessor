//
//  ViewController.swift
//  YoutubeVideoDownloader
//
//  Created by MOHAMED ARRADI-ALAOUI on 22/01/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import YoutubeVideoLinkProcessor

class ViewController : UIViewController {
    
    let downloadSegue : String = "downloadSegue"
    let playbackSegue : String = "playbackSegue"
    
    var downloadUrl : String = ""
    
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var downloadVideoButton : UIButton!
    @IBOutlet weak var watchItButton : UIButton!
    
    @IBOutlet weak var activityLoader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLoader.isHidden = true
        textField.text = "https://www.youtube.com/watch?v=X7FVYJ6ONXk"
        downloadVideoButton.isHidden = true
        self.watchItButton.isHidden = true
    }

    @IBAction func getVideoLink(sender : UIButton)
    {
        self.view.endEditing(true)
        
        guard self.textField.text!.isEmpty == false else {
            let alert = UIAlertController(title: "Alert", message: "Link Empty", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
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
               self.downloadUrl = link
               self.downloadVideoButton.isHidden = false
               self.watchItButton.isHidden = false
            }
            
        })
    }
    
    @IBAction func downloadVideo(sender : UIButton)
    {
        self.performSegue(withIdentifier: self.downloadSegue, sender: self)
    }
    
    @IBAction func watchVideo(sender : UIButton)
    {
        UIApplication.shared.openURL(URL(string: self.downloadUrl)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == downloadSegue {
            let viewController:DownloaderViewController = segue.destination as! DownloaderViewController
            viewController.downloadUrl = self.downloadUrl
        }
    }
}
