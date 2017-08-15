# IHEqualizerView
A simple, intuitive audio asset visualiser for iOS.

# HighLights
Written purely in SWIFT. Very simple and lightweight. Hardly 128 lines of Code. Color Coding for differnt output range 

* Green line for low output
* Yellow for medium
* Red for high output

# Getting Started

To begin using IHEqualizerView you must first make sure you have the proper build requirements.

# Build Requirements

## iOS

10.0+

# Adding To Project

You can add IHEqualizerView to your project in a few ways: 

The way to use IHEqualizerView is to download the Ibrahimhass class in your project as is and use.

# ScreeShot
![simulator screen shot 16-aug-2017 12 23 44 am](https://user-images.githubusercontent.com/16992520/29331253-6c614fcc-8219-11e7-970a-d196bb2029e7.png)

# Usage

## StoryBoard

Make the UIView a subclass of IHEqualizerView, make its outlet and initialise as follows:

    @IBOutlet var musicView: IHWaveFormView!

    // Getting the Path of the Audio Asset in this case this is bundled in to the main Bundle with the fileName 
    var url : URL?
    let path = Bundle.main.path(forResource: "Tere Liye Mere Kareem (DownloadMp3Song.Net) (320Kbps).mp3", ofType:nil)!
    url = URL(fileURLWithPath: path)
    self.musicView.setUpView(urlToPlay: url!, 2.0, 1.0)

