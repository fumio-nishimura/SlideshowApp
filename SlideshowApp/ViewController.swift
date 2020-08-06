//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 西村史旺 on 2020/08/05.
//  Copyright © 2020 Fumio Nishimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! // imageView の設定
    
    @IBOutlet weak var nextButton: UIButton! //進む
    
    @IBOutlet weak var backButton: UIButton! //戻る
    
    @IBOutlet weak var startStopButton: UIButton! //再生・停止
    
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // imageView に画像を設定
        let image = UIImage(named: "endGame")
        imageView.image = image
    }
    
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の配列
    let imageNameArray = ["endGame", "tonyStake", "captainAmerica", "mightyThor", "hawkEye", "captainMarvel", "blackWidow"]
    
    // 表示している画像の番号 から名前を取り出す
    func displayImage() {
        let name = imageNameArray[displayImageNo]
        
        // 取り出した画像を imageView に設定
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    // 進むボタン
    @IBAction func tapNextButton(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号 から画像を表示
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    // 戻るボタン
    @IBAction func tapBackButton(_ sender: Any) {
        if displayImageNo >= 1 && displayImageNo <= imageNameArray.count - 1 {
            // 画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号 から画像を表示
            displayImage()
        } else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }

    // 再生・停止ボタン
    @IBAction func tapStartStopButton(_ sender: Any) {
        // timer が存在しない時だけタイマーを生成
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生ボタンタップ時に、進む・戻るボタンを非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンの名前を 停止 に設定
            startStopButton.setTitle("停止", for: .normal)
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            // 停止ボタンタップ時に、進む・戻るボタンを再表示
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの名前を 再生 に設定
            startStopButton.setTitle("再生", for: .normal)
        }
    }
    
    // #selector で呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタン と同じ動作を行う
        if displayImageNo < imageNameArray.count - 1 {
            displayImageNo += 1
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    // 画像がタップされた時に処理を行う
    @IBAction func tapImage(_ sender: Any) {
        self.performSegue(withIdentifier: "toBigImage", sender: nil)
    }
    
    // 遷移先へデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue から遷移先の BigImageViewController を取得する
        let bigImageViewController: BigImageViewController = segue.destination as! BigImageViewController
        // 表示している画像の番号 から画像を設定
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        // 遷移先で宣言している selectedImg へ値を代入して渡す
        bigImageViewController.selectedImg = image
        
    }
    
    // 遷移先から戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

