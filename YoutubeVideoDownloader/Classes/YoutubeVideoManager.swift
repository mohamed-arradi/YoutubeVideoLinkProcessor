//
//  YoutubeVideoManager.swift
//  Created by MOHAMED ARRADI-ALAOUI on 22/01/2017.
//
//

import Foundation

 public class YoutubeVideoManager : NSObject  {
    
    private var url : String?
    
    private var linkProcessor : YoutubeRequestVideoProcessor
 
    public init(url : String) {
        self.url = url
        self.linkProcessor = YoutubeRequestVideoProcessor(url: self.url!)
    }

   public func fetchVideoLink(completion: @escaping (_ link: String, _ error : NSError?) -> Void)
    {
        self.linkProcessor.processLink { (link : String, error : NSError?) in
            completion(link,error)
        }
    }
    
}
