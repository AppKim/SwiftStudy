//
//  MealDetailViewController.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit


extension MealDetailViewController: RatingViewDelegate {
    
    func ratingStatusChanged() {
        saveButtonStatus()
    }
}

class MealDetailViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var mealModel = MealModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingView.delegate = self
        
        // ViewControllerのセルからの値を受け取って設定する
        nameField.text = mealModel.name
        ratingView.rating = mealModel.rating
        mealImageView.image = mealModel.photo ?? UIImage(named: "defaultPhoto")
        
        // 保存ボタン非活性化
        saveButton.isEnabled = false
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(imageTap))
        mealImageView.addGestureRecognizer(tapGesture)
        // ViewImageはボタンと違ってaddTargetメソッドがないためビューへジェスチャーを認識するように設定する必要がある。
        mealImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTap() {
        print("image tap")
        
        let imagePickerController = UIImagePickerController()
        // ギャラリーからイメージが選択できるようにする
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        //　https://studyhard24.tistory.com/46
        // https://baked-corn.tistory.com/45
        imagePickerController.delegate = self
        
        
    }
    // imageAction
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else{
            return
        }
        
        // imageViewへ設定
        mealImageView.image = selectedImage
        // imageModelへ設定
        saveButtonStatus()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // ボタン制御
    @IBAction func didChanged(_ sender: UITextField) {
        
        // バーリーデーション処理
        saveButtonStatus()

    }
    
    // バーリーデーション
    func saveButtonStatus() {
        // テキストフィルドの入力有無確認
            if nameField.text?.isEmpty ?? true{
                saveButton.isEnabled = false
            }else{
                saveButton.isEnabled = true
            }
        
    }
    
    // 保存
    @IBAction func saveMeal(_ sender: Any) {
        print("save meal")
        // rating値をモデルに設定
        mealModel.rating = ratingView.rating
        // 入力したテキストフィルドの値をモデルに設定
        mealModel.name = nameField.text ?? ""
        mealModel.photo = mealImageView.image
        
        // model save
        self.performSegue(withIdentifier: "toMealList", sender: self)
        
    }
    
    @IBAction func closeVC(_ sender: Any) {
        
        
        // self.navigationController.push(show)
        // pop
        
        // self.present
        // dismiss
        
        let presentingVC = presentingViewController is UINavigationController
        
        if presentingVC == true {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
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

