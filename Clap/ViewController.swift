//
//  ViewController.swift
//  Clap
//
//  Created by Yuki Sakata on 2016/02/10.
//  Copyright © 2016年 Yuki Sakata. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer: AVAudioPlayer!
    var soundCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath: String(soundFilePath))
        
        //AVAudioPlayerのインスタンス化
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
        }catch {
            print("音楽ファイルを読み込めませんでした")
        }
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    //いくつ選択肢をつくるか
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //選択肢に何を表示していくか１
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton() {
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    
}

