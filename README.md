# IHEqualizerView
A simple, intuitive audio asset visualiser for iOS.

# HighLights
Written purely in SWIFT. Very simple and lightweight. Hardly 128 lines of Code. Color Coding for differnt output range 

* Green line for low output
* Yellow for medium
* Red for high output
* Based on the output distribution pattern of Recorder App from Apple

# Getting Started

To begin using IHEqualizerView you must first make sure you have the proper build requirements.

# Build Requirements

## iOS

10.0+

# Adding To Project

You can add IHEqualizerView to your project in a few ways: 

The way to use IHEqualizerView is to download the Ibrahimhass class in your project as is and use.

# ScreenShot
![simulator screen shot 16-aug-2017 12 23 44 am](https://i.stack.imgur.com/HsdX1.gif)
# Usage

## StoryBoard

Make the UIView a subclass of IHEqualizerView, make its outlet and initialise as follows:

    @IBOutlet var musicView: IHWaveFormView!

    // Getting the Path of the Audio Asset in this case this is bundled in to the main Bundle with the fileName 
    var url : URL?
    let path = Bundle.main.path(forResource: "bensound-sunny.mp3", ofType:nil)!
    url = URL(fileURLWithPath: path)
    self.musicView.setUpView(urlToPlay: url!, lineWith: 2.0, lineSeperation: 1.0)

