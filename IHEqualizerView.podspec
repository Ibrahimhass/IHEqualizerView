#
# Be sure to run `pod lib lint IHEqualizerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IHEqualizerView'
  s.version          = '0.1.0'
  s.summary          = 'A simple, intuitive audio asset line bar visualiser.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'SWIFT, Realtime Audio Visualiser. Line Visualiser having differnt colors for different output levels.'
  s.homepage         = 'https://github.com/Ibrahimhass/IHEqualizerView'
  # s.screenshots     = 'https://camo.githubusercontent.com/629245e6ca6254235bea5347110c077967fad9a4/68747470733a2f2f692e737461636b2e696d6775722e636f6d2f48736458312e676966'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Md Ibrahim Hassan' => 'mdibrahimhassan@gmail.com' }
  s.source           = { :git => 'https://github.com/Ibrahimhass/IHEqualizerView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/IbrahimH_ss_n'

  s.ios.deployment_target = '10.0'

  s.source_files = 'IHEqualizerView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IHEqualizerView' => ['IHEqualizerView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  #s.pod_target_xcconfig = { "SWIFT_VERSION" => "4.0" }
  s.frameworks = 'UIKit', 'AVFoundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
