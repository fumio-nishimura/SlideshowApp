//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by 西村史旺 on 2020/08/05.
//  Copyright © 2020 Fumio Nishimura. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! // imageView を設定

    var selectedImg: UIImage! // 遷移元からデータを受け取るための変数
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // imageView に画像を設定
        imageView.image = selectedImg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
