//
//  ViewController.swift
//  DateAndPicker
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        
        var dateComponet = DateComponents()
        dateComponet.day = 2
        
        var maxDate = Calendar.current.date(byAdding: dateComponet, to: currentDate)
        
        datePicker.minimumDate = currentDate
        datePicker.maximumDate = maxDate
        
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        print(sender.date.timeIntervalSince1970)
        
    }
    


}

