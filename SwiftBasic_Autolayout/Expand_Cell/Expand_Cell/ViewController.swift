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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 使うセルを指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = "test"
        return cell
    }
    
    // セルの数指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    


}

