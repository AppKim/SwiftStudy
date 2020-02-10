//
//  ViewController.swift
//  StopWatch
//
//  Created by 김준석 on 2020/02/09.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 分
    @IBOutlet weak var labelMinute: UILabel!
    // 秒
    @IBOutlet weak var labelSecond: UILabel!
    // ミリ秒
    @IBOutlet weak var labelMillisecond: UILabel!
    
    // 開始OR停止
    @IBOutlet weak var startStopButton: UIButton!
    // 初期化
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    
    // StopWatchプラグ
    var isStarting = false
    
    // 開始時間
    var startTime = 0.0
    // 経過時間
    var elapsed = 0.0
    
    // 開始OR停止処理
    @IBAction func startStop(_ sender: Any) {
        if isStarting {
            // Stopの場合
            // 経過時間　= 1970/01/01 - 開始時間
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            resetButton.isEnabled = true
        }else{
            // Start場合
            // 開始時間 = 1970/01/01 - 経過時間
            startTime = Date().timeIntervalSince1970 - elapsed
            // 0.01間隔で時間を更新
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            startStopButton.setTitle("Stop", for: .normal)
            resetButton.isEnabled = false
        }
        isStarting = !isStarting
    }
    // 初期化処理
    @IBAction func reset(_ sender: Any) {
        elapsed = 0.0
        startTime = Date().timeIntervalSince1970 - elapsed
        resetDateLabel()
    }
    
    func resetDateLabel() {
        // ラベルの初期値設定
        labelMinute.text = "00"
        labelSecond.text = "00"
        labelMillisecond.text = "00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ボタンの名前設定
        startStopButton.setTitle("Start", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        resetDateLabel()
    }
    
    @objc func updateTime() {
        elapsed = Date().timeIntervalSince1970 - startTime
        // 時間計算
        let date = Date(timeIntervalSince1970: elapsed)
        // 時間フォーマット設定
        let df = DateFormatter()
        df.dateFormat = "SS"
        labelMillisecond.text = df.string(from: date)
        
        df.dateFormat = "ss"
        labelSecond.text = df.string(from: date)
        
        df.dateFormat = "mm"
        labelMinute.text = df.string(from: date)
        
        print("start : \(startTime)")
        print("elapsed : \(elapsed)")
        
    }


}

