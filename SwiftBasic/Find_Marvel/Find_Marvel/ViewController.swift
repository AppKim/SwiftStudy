//
//  ViewController.swift
//  Find_Marvel
//
//  Created by 김준석 on 2020/02/20.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit
import Vision

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
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func openPhotoLibray(_ sender: Any) {
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    // イメージマシンへ転送
    func processImage(_ image: UIImage) {
        // ML Model
        if let model = try? VNCoreMLModel(for: MarvelClassifier().model){
            let request = VNCoreMLRequest(model: model) { (request, error) in
                if let results = request.results as? [VNClassificationObservation]{
                    
                    let firstValue = results.sorted { (lh, rh) -> Bool in
                        // 내림차순
                        return lh.confidence > rh.confidence
                    // ソート後、最初の値だけ取得
                    }.first
                    
                    if let bestMatch = firstValue{
                        self.nameLabel.text = bestMatch.identifier
                        self.percentLabel.text = "\(bestMatch.confidence * 100) %"
                    }
                }
                
            }
            
            // image data
            if let imageData = image.jpegData(compressionQuality: 0.7){
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        
        
        }else {
            
        }
        
        
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

