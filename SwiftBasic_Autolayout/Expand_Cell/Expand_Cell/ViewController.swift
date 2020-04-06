//
//  ViewController.swift
//  Expand_Cell
//
//  Created by 김준석 on 2020/04/01.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    // Text
    // ExpandCondition
    // model
    
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textArray = ["short","longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong",
            "short",
            "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong",
            "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
            ]
        
        for (_ , value) in textArray.enumerated() {
            
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
            
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 使うセルを指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        // 改行有無
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        }else{
            cell.descriptionLabel.numberOfLines = 1
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    // セルの数指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    // セル選択時のアクション
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        
        tableView.reloadRows(at: [indexPath], with: .none)
        
        /*
         오토레이아웃설정했을때 화면이 튀거하는현상해결하는방법
         パーフォマンス改善
         1.heightForRowAtにて正確な高さを指定することで解決可能→完全に改善可能
         2.tableView.reloadData()→ある程度改善可能
         3.tableView.estimatedSectionHeaderHeight = 0→ある程度改善可能
           tableView.estimatedSectionFooterHeight = 0
         4.UIView.setAnimationsEnabled(false)(完全に解決可能)→完全に改善可能
           tableView.reloadRows(at: [indexPath], with: .none)
           UIView.setAnimationsEnabled(true)
         */
    }
    
    
    


}

