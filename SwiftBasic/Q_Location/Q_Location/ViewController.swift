//
//  ViewController.swift
//  Q_Location
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var locactionManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locactionManager.delegate = self
        locactionManager.desiredAccuracy = kCLLocationAccuracyBest
        // 사용자 허용 alert
        locactionManager.requestWhenInUseAuthorization()
        
        // 허용여부체크
        if CLLocationManager.locationServicesEnabled() {
            locactionManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first {
            // 위도
            print("lat \(userLocation.coordinate.latitude)")
            // 경도
            print("lon \(userLocation.coordinate.longitude)")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error \(error)")
    }


}

