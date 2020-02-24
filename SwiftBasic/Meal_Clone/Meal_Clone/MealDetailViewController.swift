//
//  MealDetailViewController.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var ratingView: RatingView!
    
    var mealModel = MealModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ViewControllerのセルからの値を受け取って設定する
        nameField.text = mealModel.name
        ratingView.rating = mealModel.rating
        mealImageView.image = mealModel.photo ?? UIImage(named: "defaultPhoto")
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
