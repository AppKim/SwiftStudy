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
        // 保存
        saveMeals()
    }
    
    // データ保存(archive)
    func saveMeals() {
        
        // データを直接保存する際はビューの更新に遅延が発生するため、バックグラウンドthreadとして実行
        DispatchQueue.global().async {
        // path
        let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
        // myFolder/meals
        guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else{
            return
        }
        // archive
        // ios11まで
        //let isSuccessSave = NSKeyedArchiver.archiveRootObject(mealList, toFile: archiveURL.path)
        
        do{
            // ios12から
            let archiveData = try NSKeyedArchiver.archivedData(withRootObject: self.mealList, requiringSecureCoding: true)
            try archiveData.write(to: archiveURL)
            
        }catch{
            print(error)
        }
        /* ios11
        if isSuccessSave {
            print("success saved")
        }else{
            print("failed save")
        }
        */
        }
        
    }
    
    
    // 削除
    var isEditMode = false
    @IBAction func doEdit(_ sender: Any) {
        isEditMode = !isEditMode
        print("\(isEditMode)")
        mealTableView.setEditing(isEditMode, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // modelにて削除
            mealList.remove(at: indexPath.row)
            // tableviewにて削除
            mealTableView.deleteRows(at: [indexPath], with: .automatic)
            // archive
            saveMeals()
        }
    }
    
    // データロード(unarchive)
    func loadMeals() -> [MealModel]? {
        // path
        let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
        // myFolder/meals
        guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else{
            return nil
        }
        guard let codedData = try? Data(contentsOf: archiveURL) else{
            return nil
        }
        guard let unarchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData) else {
            return nil
        }
        
        return unarchivedData as? [MealModel]
        
        //return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [MealModel]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedMeals = loadMeals() {
            self.mealList = loadedMeals
        }
        
        if mealList.count == 0 {
            let dummy1 = MealModel.init(name: "パスタ", photo: UIImage(named: "meal1"), rating: 3)
            let dummy2 = MealModel.init(name: "ケバブ", photo: UIImage(named: "meal2"), rating: 2)
            let dummy3 = MealModel.init(name: "ステーキ", photo: UIImage(named: "meal3"), rating: 5)
            mealList.append(dummy1)
            mealList.append(dummy2)
            mealList.append(dummy3)
        }
        
        
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
