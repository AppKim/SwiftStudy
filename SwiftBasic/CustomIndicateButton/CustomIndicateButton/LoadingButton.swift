//
//  LoadingButton.swift
//  CustomIndicateButton
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class LoadingButton: UIButton {
    
    // activity indicator view
    // 내부에서만 사용하기때문에 프라이빗
    private let indicator = UIActivityIndicatorView()
    
    private func makeIndicate() {
        // 버튼위에 인디케이터 삽입
        self.addSubview(indicator)
        
        // 화면으로 구성 되어있는것을 직접만들어서쓰는경우 main쓰례드에서작동
        // 콘트롤러에서 직접 연결해서 코드를 적는경우는 메인쓰레드에서 작동이되지만 코드에서처리를 하면 메인쓰레드부터 작동이안됨
        DispatchQueue.main.async {
            self.indicator.isHidden = true
        }
        // 인디케이터 버튼의 액션영역을 가리기때문에 가리지않게 설정
        indicator.isUserInteractionEnabled = false
        
        // 인디케이터 스타일 설정
        indicator.style = .medium
        indicator.startAnimating()
        
        // 인디케이터 위치 조정,활성화
        indicator.translatesAutoresizingMaskIntoConstraints = false // 트루일경우 프레임설정 필요
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // init
        
        makeIndicate()
        
    }
    
    public func startLoading() {
        // 버튼의 타이틀컬러를 투명하게
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(0),for: UIControl.State.normal)
        // 인디케이트 활성화
        indicator.isHidden = false
    }
    
    public func stopLoading() {
        // 버튼의 타이틀컬러를 안투명하게
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(1),for: UIControl.State.normal)
        // 인디케이트 비활성화
        indicator.isHidden = true
    }
    
}
