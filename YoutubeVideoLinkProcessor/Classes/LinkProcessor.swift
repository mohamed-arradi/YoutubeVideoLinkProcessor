//
//  LinkProcessor.swift
//  Pods
//
//  Created by MOHAMED ARRADI-ALAOUI on 22/01/2017.
//
//

import Foundation

class LinkProcessor {
    
    let subsequence : Int = 15600
    
    private var htmlData : NSString
    
    init(htmlData : NSString)
    {
       self.htmlData = htmlData
    }
    
    func processLink() -> String
    {
        var downloadURL : [String] = []
        var downloadLink : String = ""
    
        if(self.htmlData != nil && self.htmlData.range(of: "url_encoded_fmt_stream_map").location != NSNotFound)
        {
            downloadURL = (self.htmlData.components(separatedBy: "url_encoded_fmt_stream_map"))
        }

        guard downloadURL.count > 1 else {
            return ""
        }
        
        var substringDownloadUrl : String = (downloadURL[1] as String)
        
        substringDownloadUrl = substringDownloadUrl.substring(with: 0..<subsequence)
        
        guard (substringDownloadUrl as NSString).range(of: "url=").location != NSNotFound else {
            return ""
        }
        
        let mp4Link : String = substringDownloadUrl.components(separatedBy: "url=")[1] as String
        
        let letters : NSMutableString = NSMutableString()
        
        for letter in mp4Link.characters
        {
            letters.append(String(letter))
            
            if letter == "\\" || letter == ","{
                break
            }
        }

        downloadLink = letters.replacingOccurrences(of: ";", with: "")
                              .replacingOccurrences(of: "\\", with: "")
                              .replacingOccurrences(of: ",", with: "")

        return downloadLink.removingPercentEncoding!
    }
}

