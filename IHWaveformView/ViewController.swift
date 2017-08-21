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
        let path = Bundle.main.path(forResource: "videoplayback (5).mp3", ofType:nil)!
        url = URL(fileURLWithPath: path)
        self.musicView.setUpView(urlToPlay: url!, lineWith: 2.0, lineSeperation: 1.0)
    }
}
