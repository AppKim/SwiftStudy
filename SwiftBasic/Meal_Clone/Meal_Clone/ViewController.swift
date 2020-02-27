//
//  ViewController.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mealList: [MealModel] = []
    
    @IBOutlet weak var mealTableView: UITableView!
    
    // saveボタン処理
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
        guard let detailVC = sender.source as? MealDetailViewController else {
            return
        }
        
        // 更新
        if let selectedIndexPath = self.mealTableView.indexPathForSelectedRow {
            mealList[selectedIndexPath.row] = detailVC.mealModel
            // 該当行のみ更新
            self.mealTableView.reloadRows(at: [selectedIndexPath], with: .none)
            // reloadを行うことで不要となる
            //self.mealTableView.deselectRow(at: selectedIndexPath, animated: true)
        // 新規
        }else{
            let insertIndexPath = IndexPath(row: mealList.count, section: 0)
            mealList.append(detailVC.mealModel)
            // 該当行のみ追加
            self.mealTableView.insertRows(at: [insertIndexPath], with: .automatic)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dummy1 = MealModel.init(name: "パスタ", photo: UIImage(named: "meal1"), rating: 3)
        let dummy2 = MealModel.init(name: "ケバブ", photo: UIImage(named: "meal2"), rating: 2)
        let dummy3 = MealModel.init(name: "ステーキ", photo: UIImage(named: "meal3"), rating: 5)
        mealList.append(dummy1)
        mealList.append(dummy2)
        mealList.append(dummy3)
        
    }
    // segueを利用し、他のViewControllerへデータを転送する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // mealDetailへ情報を受け渡す
        if segue.identifier == "presentDetail"{
            
        }else if segue.identifier == "showDetail" {
            // data転送先指定
            let detailVC = segue.destination as! MealDetailViewController
            // 選択したセル
            let selectedCell = sender as! MealCell
            // セルのindex値取得
            if let selectedIndexPath = mealTableView.indexPath(for: selectedCell){
                // セルの行ごとに情報を取得
                detailVC.mealModel = mealList[selectedIndexPath.row]
            }
            
        }
    }


}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mealCell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        as! MealCell
        
        mealCell.name.text = mealList[indexPath.row].name
        mealCell.ratingView.rating = mealList[indexPath.row].rating
        // 該当viewはジェスチャー認識しないように非活性化
        mealCell.ratingView.isUserInteractionEnabled = false
        mealCell.mealImageView.image = mealList[indexPath.row].photo ?? UIImage(named: "defaultPhoto")
        
        
        return mealCell
    }
    
    
}