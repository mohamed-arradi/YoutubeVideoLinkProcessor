#
# Be sure to run `pod lib lint YoutubeVideoDownloader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YoutubeVideoLinkProcessor'
  s.version          = '1.0.1'
  s.summary          = 'YoutubeVideoLinkProcessor give you the direct link of a Youtube Video to download it ! '

  s.description      = <<-DESC
                      The goal was to create a library that gather the downloadable video url from a youtube video.
                      We all know how it's a pain  to download a youtube video inside our gallery. 
                      I'm sure all know many website in order to get the link of some mp4 video ! Now you can do it straightaway from your app 
                       DESC

  s.homepage         = 'https://github.com/mohamed-arradi/YoutubeVideoLinkProcessor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohamed Arradi-Alaoui' => 'arradi.mohamed@gmail.com' }
  s.source           = { :git => 'https://github.com/mohamed-arradi/YoutubeVideoLinkProcessor.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/arradimohamed'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YoutubeVideoLinkProcessor/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YoutubeVideoDownloader' => ['YoutubeVideoDownloader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
