//
//  IHWaveFormView.swift
//  IHWaveformView
//
//  Created by Md Ibrahim Hassan on 16/08/17.
//  Copyright © 2017 Md Ibrahim Hassan. All rights reserved.
//

import UIKit
import AVFoundation

class IHWaveFormView: UIView, AVAudioPlayerDelegate {
    private var bombSoundEffect: AVAudioPlayer!
    private var dataArray : [Float] = []
    private var totalCount : Int = 0
    private var xPoint : CGFloat = 0.0
    private var player : AVAudioPlayer!
    private var gameTimer: Timer!
    private var internallineWidth : CGFloat!
    private var internallineSeperation : CGFloat!
    
    internal func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.gameTimer.invalidate()
    }
    func addCentreLine(){
        let centerLineView : UIView = UIView.init(frame: CGRect.init(x: 0, y: self.frame.size.height / 2.0, width: self.frame.size.width, height: 1))
        centerLineView.backgroundColor = self.invertColor(self.backgroundColor!)
        self.addSubview(centerLineView)
    }
    func invertColor(_ color : UIColor) -> UIColor {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.backgroundColor?.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lineColor = UIColor.init(red: self.invert(r), green: self.invert(g), blue: self.invert(b), alpha: a)
        return lineColor
    }
    func invert(_ val : CGFloat) -> CGFloat{
        let newVal = 1.0 - val
        return (newVal)
    }
    func setUpView(urlToPlay : URL, lineWith : CGFloat?, lineSeperation : CGFloat?) {
        self.addCentreLine()
        self.addOverlayLabels()
        internallineWidth = 2.0
        internallineSeperation = 1.0
        if (lineWith != nil){
            internallineWidth = lineWith
        }
        if (lineSeperation != nil){
            internallineSeperation = lineSeperation
        }
        self.getPath(url: urlToPlay)
        bombSoundEffect.rate = 1.0
    }
    private func getPath(url : URL){
        do {
            player = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect = player
            bombSoundEffect.enableRate = true
            bombSoundEffect.isMeteringEnabled = true
            bombSoundEffect.delegate = self
            player.play()
            
            let duration = player.duration
            let val = CGFloat(duration) / (CGFloat(self.frame.size.width))
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(val * (internallineWidth + internallineSeperation)), target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
        } catch {
            // couldn't load file :(
        }
    }
    private func makeNewWaveForm(_ yValNegative : CGFloat) -> (CGFloat){
        let yVal : CGFloat = CGFloat(abs(yValNegative))
        var yOffSet : CGFloat = 0.0
        let totalHeight = self.frame.size.height / 12.0
        if (yVal > 0 && yVal <= 1){
            yOffSet = (yVal - 0)/(1) * totalHeight
        }
        else if (yVal > 1 && yVal <= 3){
            yOffSet = totalHeight + (yVal - 1)/2 * totalHeight
        }
        else if (yVal > 3 && yVal <= 6){
            yOffSet = totalHeight * 2 + (yVal - 3)/3 * totalHeight
        }
        else if (yVal > 6 && yVal <= 7){
            yOffSet = totalHeight * 3 + (yVal - 6)/1 * totalHeight
        }
        else if (yVal > 7 && yVal <= 10){
            yOffSet = totalHeight * 4 + (yVal - 7)/3 * totalHeight
        }
        else if (yVal > 10 && yVal <= 120){
            yOffSet = totalHeight * 5 + (yVal - 10)/(120 - 10) * totalHeight
        }
        return (yOffSet)
    }
    func addOverlayLabels() {
        let values : [String] = ["0", "-1", "-3", "-6", "-7", "-10"]
        var valuesFinal : [String] = values + [" "]
        valuesFinal += values.reversed()
        for i in 0...12{
            let topLabel = UILabel.init(frame: CGRect.init(x: 0, y: CGFloat(i) * self.frame.size.height / 12.0 - self.frame.size.height / 17.0, width: self.frame.size.height / 12.0, height: self.frame.size.height / 12.0))
            topLabel.center.y = 0 + CGFloat(i) * self.frame.size.height / 12.0
            topLabel.text = "\(valuesFinal[i]) dB"
            topLabel.textAlignment = .center
            topLabel.textColor = self.invertColor(self.backgroundColor!)
//            topLabel.backgroundColor = .red
            topLabel.adjustsFontSizeToFitWidth = true
            self.addSubview(topLabel)
        }
    }
    private func getReflectionPoint(yInput : CGFloat) -> CGFloat{
        return (self.frame.size.height - CGFloat(abs(yInput)))
    }
    @objc private func trackAudio() {
        bombSoundEffect.updateMeters()
        let dBLogValue : Float = bombSoundEffect.averagePower(forChannel: 0)
        dataArray.append(dBLogValue)
        let twoDecimalPlaces = String(format: "%.2f", dataArray[totalCount])
        totalCount += 1
        self.generatePoints1(dBVal: twoDecimalPlaces)
    }
    private func generatePoints1(dBVal : String){
        xPoint += internallineSeperation
        let aPath = UIBezierPath()
        let floatVal : Float = Float(dBVal)!
        let fromYPoint : CGFloat = self.makeNewWaveForm(CGFloat(floatVal))
        let toYPoint : CGFloat = self.getReflectionPoint(yInput: fromYPoint)
        aPath.move(to: CGPoint(x:xPoint , y: fromYPoint))
        aPath.addLine(to: CGPoint(x: xPoint, y: toYPoint))
        xPoint += internallineWidth
        let diff = toYPoint - fromYPoint
        let shapeLayer1 = CAShapeLayer()
        let shapeLayer2 = CAShapeLayer()
        let shapeLayer3 = CAShapeLayer()
        self.layer.insertSublayer(shapeLayer1, at: 0)
        self.layer.insertSublayer(shapeLayer2, at: 1)
        self.layer.insertSublayer(shapeLayer3, at: 2)
        if diff <= 0.33 * self.frame.size.height {
            shapeLayer1.path = aPath.cgPath
            shapeLayer1.strokeColor = UIColor.green.cgColor
            shapeLayer1.lineWidth = internallineWidth
            shapeLayer1.zPosition = 2.0
        }
        else if (diff <= self.frame.size.height * 0.66 && diff >= 0.33 * self.frame.size.height) {
            shapeLayer2.path = aPath.cgPath
            shapeLayer2.strokeColor = UIColor.yellow.cgColor
            shapeLayer2.lineWidth = internallineWidth
            shapeLayer1.zPosition = 0.0
            shapeLayer3.zPosition = 1.0
            shapeLayer2.zPosition = 2.0
        }
        else if (diff >= 0.67 * self.frame.size.height)
        {
            shapeLayer3.path = aPath.cgPath
            shapeLayer3.strokeColor = UIColor.red.cgColor
            shapeLayer3.lineWidth = internallineWidth
            shapeLayer2.zPosition = 1.0
            shapeLayer1.zPosition = 0.0
            shapeLayer3.zPosition = 2.0
        }
    }
    /*Invert Color*/
}
//extension UIColor {
//    var coreImageColor: CIColor {
//        return CIColor(color: self)
//    }
//    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        let coreImageColor = self.coreImageColor
//        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
//    }
//}
