//  MIT License
//
//Copyright (c) 2017 Md Ibrahim Hassan
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var musicView: IHWaveFormView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.musicView.setUpView(urlToPlay: url!, lineWith: 2.0, lineSeperation: 1.0)
        self.musicView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.8509803922, alpha: 1)
        self.musicView.delegate = self
        self.musicView.dataSource = self
        
    }
    
}

extension ViewController: IHWaveFormViewDelegate {
    func didFinishPlayBack() {
        print ("playBack Finished")
    }
    
    func didStartPlayingWithSuccess() {
        print ("Playback started successfully")
    }
}

extension ViewController: IHWaveFormViewDataSource {
    
    func urlToPlay() -> URL {
        var url : URL?
        let path = Bundle.main.path(forResource: "bensound-sunny.mp3", ofType:nil)!
        url = URL(fileURLWithPath: path)
        return url!
    }
    
    func preRender() -> Bool {
        return true
    }
    
}
