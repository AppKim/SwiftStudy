//
//  ViewController.swift
//  Find_Marvel
//
//  Created by 김준석 on 2020/02/20.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mavelImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    // photo
     var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func showCamera(_ sender: Any) {
        
    }
    
    @IBAction func openPhotoLibray(_ sender: Any) {
    }
    // イメージマシンへ転送
    func processImage(_ image: UIImage) {
        // ML Model
        
        // Find
        
    }
}

extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    // ImageLoad
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.mavelImageView.image = image
            self.processImage(image)
        }
        // cameraを落とす
        picker.dismiss(animated: true, completion: nil)
    }
}

