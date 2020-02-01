//
//  ViewController.swift
//  Flashlight
//
//  Created by 김준석 on 2019/12/15.
//  Copyright © 2019 Kim JunSeok. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var flashImageView: UIImageView!
    
    //変数名を変更する際はMain.StotyBoardのソースコードとも合わせる必要がある。
    //一致していない場合はBuildした際にエラーが発生する。
    //変数名を変更する際はCommand+辺数名をクリックし、Rename機能より変更する。
    
    var isOn = false
    var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSound()
    }
    
    func prepareSound(){
        let path = Bundle.main.path(forResource: "switch.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            //soundPlayer?.play()
            soundPlayer?.prepareToPlay()
            
        } catch {
            // couldn't load file :(
        }
    }

    @IBAction func switchTapped(_ sender: Any) {
        
        //ボタンを押下するたびにprepareSoundメソッドを実行すると、CPUに負荷が上がるので
        //prepareSoundメソッドをビルドする際にメモリ上で準備しておいて、playだけする。
        //prepareSound()
        soundPlayer?.play()
        
        isOn = !isOn
//        if isOn == true{
//
//            switchButton.setImage(UIImage(named: "onSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "onBG")
//
//        }
//        else {
//            switchButton.setImage(UIImage(named: "offSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "offBG")
//        }
        
        switchButton.setImage(isOn ? #imageLiteral(resourceName: "onSwitch") : #imageLiteral(resourceName: "offSwitch"), for: .normal)
        flashImageView.image = isOn ? #imageLiteral(resourceName: "onBG") : #imageLiteral(resourceName: "offBG")
        
    }
    
    //File追加する際のオプションについて
    //CreateGroups,CreateFolderReference
    //createGroupsは使用するファイル名のみ指定すれば使える。//createFolderReferenceにチェックすると、フォルダのディレクトリを全部指定してあげる必要がある。
    
    
    
    
}

