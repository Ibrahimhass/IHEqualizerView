# IHEqualizerView
A simple, intuitive audio asset visualiser for iOS.

# Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

# Highlights
Very simple and lightweight. Color Coding for differnt output range. Written in Swift.

* Pale red for low output
* Light red for medium
* Red for high output
* Based on the output distribution pattern of Recorder App from Apple
* Option to pre-render audio file

# Getting Started

To begin using IHEqualizerView you must first make sure you have the proper build requirements.


# Screen Recordings
| | |
|:-------------------------:|:-------------------------:|
|<img width="400" alt="Screen Recording 1" src="https://i.stack.imgur.com/HsdX1.gif"> |  <img width="400" alt="Screen Recording 2" src="https://user-images.githubusercontent.com/16992520/35468838-fc468080-034c-11e8-8a21-ac2be0721cf6.gif">|

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

