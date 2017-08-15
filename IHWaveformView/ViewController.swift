//
//  ViewController.swift
//  IHWaveformView
//
//  Created by Md Ibrahim Hassan on 13/08/17.
//  Copyright © 2017 Md Ibrahim Hassan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var musicView: IHWaveFormView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var url : URL?
        let path = Bundle.main.path(forResource: "Tere Liye Mere Kareem (DownloadMp3Song.Net) (320Kbps).mp3", ofType:nil)!
        url = URL(fileURLWithPath: path)
       // self.musicView.setUpView(urlToPlay: url!)
        self.musicView.setUpView(urlToPlay: url!, 2.0, 2.8)
    }
}
