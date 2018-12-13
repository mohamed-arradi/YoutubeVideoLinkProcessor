//
//  DownloaderViewController.swift
//  YoutubeVideoDownloader
//
//  Created by MOHAMED ARRADI-ALAOUI on 23/01/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Photos
import Alamofire
import AssetsLibrary

class DownloaderViewController : UIViewController {

    var downloadUrl : String = ""
    
    @IBOutlet weak var progressView : UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.downloadVideo()
    }

    func downloadVideo()
    {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let pathComponent = "\(NSUUID().uuidString).mp4"
            
            documentsURL.appendPathComponent(pathComponent)
            
            return (documentsURL, [.removePreviousFile])
        }
        
        Alamofire.download(self.downloadUrl, to: destination).responseData { response in
            if let destinationUrl = response.destinationURL {
                
                PHPhotoLibrary.requestAuthorization({ (authorizationStatus: PHAuthorizationStatus) -> Void in
                        // check if user authorized access photos for your app
                        if authorizationStatus == .authorized {
                            PHPhotoLibrary.shared().performChanges({
                                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: destinationUrl)}) { completed, error in
                                    if completed {
                                        let alertController = UIAlertController(title: "Your video was successfully saved", message: nil, preferredStyle: .alert)
                                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                        alertController.addAction(defaultAction)
                                        self.present(alertController, animated: true, completion: nil)
                                        print("completed")
                                    } else {
                                        print(error?.localizedDescription ?? "")
                                    }
                            }
                        }
                    })
                
                }
            }
        .downloadProgress { progress in
                self.progressView.progress = Float(progress.fractionCompleted)
        }
    }
    
}
