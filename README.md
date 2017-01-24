# YoutubeVideoLinkProcessor

## Synopsis

Everyone has at least wanted to download a video from youtube, and everyone know many website that provide you that feature (downloadvideosfrom.com, etc..), but why not having it straight from your app !.

So as the main technicial issue is to get the downloadable link from a youtube video link.

So this cocoapod library get you the direct link to the mp4 a youtube video link.

## Motivation

I made that project as I really want this feature available for the user, as a safari extension or an app extension. The user should be able to download a video from youtube on his gallery on the easiest way.

## Installation

This library is compatible for iOS 8 + and written in Swift 3.0

Via CocoaPods : 

Add the dependency in your podfile as below 

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'YoutubeVideoLinkProcessor'
end
```

Then, run the following command:

```
$ pod install
```

Via normal import : 

Just import the swift classes on the classes folder : 

1. LinkProcessor.swift
2. StringExtension.swift
3. YoutubeRequestVideoProcessor.swift
4. YoutubeVideoManager.swift

## Code Example

A simple example of an use case : 

         let youtubeManager : YoutubeVideoManager = YoutubeVideoManager(url: "https://www.youtube.com/watch?v=XXXXXXXX")
         
         youtubeManager.fetchVideoLink(completion: { (link : String, error : NSError?) in

         	if(error == nil)
         	{
         //Do what you want with the returned link (download the video or stream it from a webview on that case)
        self.webView.loadRequest(URLRequest(url: URL(string: link)!))
    		}
            
         })
    }

Checkout the Example App in the folder Example.

## ShowCase

[![Simple Demo](http://img.youtube.com/vi/-uL5eqPA6GA/0.jpg)](https://www.youtube.com/watch?v=-uL5eqPA6GA)

## License

The license used is under MIT.