# YoutubeVideoLinkProcessor

## Synopsis

Everyone has at least wanted to download a video from youtube, and everyone know many website that provide you that feature (downloadvideosfrom.com, etc..), but why not having it straight from your app !.

So as the main technicial issue is to get the downloadable link from a youtube video link.

So this cocoapod library get you the direct link to the mp4 video from https://www.youtube.com/watch?v=video_id! 

## Motivation

I made that project as I really want this feature available for the user, as a safari extension or an app extension. The user should be able to download a video from youtube on his gallery on the easiest way.

## Installation

This library is compatible for iOS 8 +

This library is written in Swift 3.0

Via CocoaPods : 

just put  pod 'YoutubeVideoLinkProcessor' in your podfile

Via normal import : 

Just import the swift classes on the classes folder (LinkProcessor.swift,StringExtension.swift,YoutubeRequestVideoProcessor.swift,YoutubeVideoManager.swift)


## Code Example

A simple example of an use case : 

      let youtubeManager : YoutubeVideoManager
        
         youtubeManager = YoutubeVideoManager(url: "https://www.youtube.com/watch?v=XXXXXXXX")
         
         youtubeManager.fetchVideoLink(completion: { (link : String, error : NSError?) in

         	if(error == nil)
         	{
         //Do what you want with the returned link (download the video or stream it from a webview on that case)
        self.webView.loadRequest(URLRequest(url: URL(string: link)!))
    		}
            
         })
    }

   
## License

The license used is under MIT.