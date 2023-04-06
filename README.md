# IHEqualizerView
A simple, intuitive audio asset visualiser for iOS.

# Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

# HighLights
Written purely in SWIFT. Very simple and lightweight. Color Coding for differnt output range.  

* Pale red for low output
* Light red for medium
* Red for high output
* Based on the output distribution pattern of Recorder App from Apple
* Option to pre-render audio file

# Getting Started

To begin using IHEqualizerView you must first make sure you have the proper build requirements.

# Build Requirements

## iOS

10.0+

## Installation

IHEqualizerView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IHEqualizerView'
```

# Adding Manually To Project

You can add IHEqualizerView to your project in a few ways: 

The way to use IHEqualizerView is to download the IHWaveFormView class file in your project as is and use.

# Screen Recordings
![simulator screen shot 16-aug-2017 12 23 44 am](https://i.stack.imgur.com/HsdX1.gif)

![10 pixel width](https://user-images.githubusercontent.com/16992520/35468838-fc468080-034c-11e8-8a21-ac2be0721cf6.gif)

# Usage

## StoryBoard

Make the UIView a subclass of IHEqualizerView, make its outlet and initialise as follows:

    @IBOutlet var musicView: IHWaveFormView!
    extension ViewController: IHWaveFormViewDataSource {
    
    func urlToPlay() -> URL {
        var url : URL?
        let path = Bundle.main.path(forResource: "bensound-sunny.mp3", ofType:nil)!
        url = URL(fileURLWithPath: path)
        
        return url!
    }

    func lineWidth() -> CGFloat { 2 }

    func lineSeperation() -> CGFloat { 1 }

    func shouldPreRender() -> Bool { true }
    }
    
## Author

Md Ibrahim Hassan, mdibrahimhassan@gmail.com

## License

IHEqualizerView is available under the MIT license. See the LICENSE file for more info.

