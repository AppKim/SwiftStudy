//
//  YourCell.swift
//  Chat_App
//
//  Created by 김준석 on 2020/04/25.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
