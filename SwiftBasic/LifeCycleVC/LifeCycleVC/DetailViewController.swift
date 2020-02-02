//
//  DetailViewController.swift
//  LifeCycleVC
//
//  Created by 김준석 on 2020/02/02.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 뷰컨트롤러에 연결된시점
    // optional, once
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
    // 뷰컨트롤러가 나올준비가된상태
    // once
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    // 화면이 준비가 되서 나오기 직전의상태
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    // 화면이 가려지거나 나타날때 계속 노출됨
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    //화면이 사라지는 시점
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    
    //
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    // 메모리에서 사라지는 시점
    deinit {
        print("deinit")
    }
    
}
