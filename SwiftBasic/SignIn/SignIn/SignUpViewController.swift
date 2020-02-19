//
//  SignUpViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSignUp.layer.cornerRadius = buttonSignUp.bounds.height / 2
        buttonSignUp.layer.borderWidth = 1
        buttonSignUp.layer.borderColor = UIColor.white.cgColor
        
    }
    
    @IBAction func signUpApiCall(_ sender: Any) {
        
        // Parameters
        let params = [
            "name":nameField.text ?? "",
            "password":passwordField.text ?? "",
            "email":emailField.text ?? "",
        ]
        // HTTP Method -> POST
        // query => body
        
        // GET => URL + query
        
        if let url = URL(string: "http://localhost:3000/loginUsers"){
            // request
            var request = URLRequest.init(url: url)
            
            request.httpMethod = "POST"
            request.httpBody = params.queryString.data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    //alert
                    return
                }
                do{
                    // response
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(LoginUser.self, from: data)
                    
                    Singleton.User.shared.info = user
                    
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
                    
                }catch{
                    print("SignUp Error \(error)")
                }
            }.resume()
            
        }
        
    }
    
    // 指定NavigationControllerへ戻る
    @IBAction func popSignInVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
