//
//  YoutubeVideoLinkProcessor.swift
//  Created by MOHAMED ARRADI-ALAOUI on 22/01/2017.
//
//

import Foundation

class YoutubeRequestVideoProcessor: NSObject {
    
    typealias CompletionHandler = (_ downloadableLink : String, _ error : NSError?) -> Void
    
    private var url : String

    init(url : String) {
        self.url = url
    }
    
    func processLink(completionHandler: @escaping CompletionHandler) {
       
        let request : NSMutableURLRequest = NSMutableURLRequest(url: URL(string: self.url)!)
  
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            
            if error == nil
            {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
               
                let linkProcessor : LinkProcessor = LinkProcessor(htmlData: dataString!)
                
                completionHandler(linkProcessor.processLink(),error as NSError?)
            }
            else
            {
                completionHandler("",error as NSError?)
            }
        }
        
        task.resume()
    }

}
