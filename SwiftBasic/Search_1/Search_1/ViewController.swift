//
//  ViewController.swift
//  Search_1
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wordList = ["america","japan","korea","アメリカ","中国","ロシア","ドイツ","イギリス","日本","フランス","韓国","イタリア","シンガポール"]
    // フィルター結果格納変数
    var filterdWordList : [String] = []
    // フィルタープラグ
    var isFilterd = false
    
    @IBOutlet weak var searchResultTableView: UITableView!
    
    // セル構成
    // 検索
    // 全体
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableViewのdelegate宣言
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
       
        // cell登録（ストーリーボードでち直接入れた場合は不要。外部で作成したセルは必須。）
        searchResultTableView.register(UINib(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        // SearchBarのインスタン生成
        let searchC = UISearchController(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        // SearchBarをNavigationItemとして設定
        self.navigationItem.searchController = searchC
        // SearchBarの隠しを無効化
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }


}
// ViewController拡張
extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    
    // cell枠出力
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch isFilterd {
        case true:
            return filterdWordList.count
        case false:
            return wordList.count
        }
    }
    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    // cellへデータ出力
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TypeCasting
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        
        if isFilterd {
            cell.wordLabel.text = filterdWordList[indexPath.row]
            return cell
        }else{
            cell.wordLabel.text = wordList[indexPath.row]
            return cell
        }
    }

}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // 検索
        if let hasTest = searchController.searchBar.text?.lowercased() {
            // 検索無
            if hasTest.isEmpty {
                isFilterd = false
            // 検索有
            }else{
                isFilterd = true
                /*
                filterdWordList = wordList.filter({ (element) -> Bool in
                    return element.contains(hasTest)
                })
                */
                // 上記の省略文
                filterdWordList = wordList.filter({$0.contains(hasTest)})
            }
            // 結果リロード
            searchResultTableView.reloadData()
        }
    }
    
    
}


