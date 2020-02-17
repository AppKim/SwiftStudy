//
//  SignInViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let loginURLString = "http://localhost:3000/loginUsers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSignIn.layer.cornerRadius = buttonSignIn.bounds.size.height / 2
        buttonSignIn.layer.borderWidth = 1
        buttonSignIn.layer.borderColor = UIColor.blue.cgColor
        
        // 画面内のネービーゲイションバー隠し
        self.navigationController?.setNavigationBarHidden(true, animated: false)
     
    }
    // ログイン処理
    @IBAction func signInAPICall(_ sender: Any) {
        
        // parameters key:value
        // get post
        // URLSession
        
        let param = [
            "username" : userNameTextField.text ?? "",
            "password" : passwordTextField.text ?? ""
        ]
        
        // query string key=value&key=value
         let parameters = param.queryString
        
        // network
        // http://localhost:3000/loginUsers
        
        // 文字列を連結しURLを作成するより以下のようにURLコンポネートオブジェクトを使用し作成することが良い
        // let loginURL = URL(string: "http://localhost:3000/loginUsers?" + parameters)
        
        // URLComponents
        var urlComponents = URLComponents(string: loginURLString)
        urlComponents?.query = parameters
        
        // OptionalTypeを外す（アンラッピング）
        // if letの使用スコープは（内
        // guard letの使用スコープはクラス内
        guard let hasURL = urlComponents?.url else {
            return
        }
        
        // model
        // codable
        
        URLSession.shared.dataTask(with: hasURL) { (data, respons, error) in
            guard let data = data else{
                return
            }
            let decoder = JSONDecoder()
            
            do{
                let user = try decoder.decode([LoginUser].self, from: data)
                print("user => \(user)")
                
                if let hasUserInfo = user.first{
                    User.shared.info = hasUserInfo
                }
                
                
            }catch{
                // Error
                print("error ==> \(error)")
            }
        // データ呼び出し
        // network接続設定として、info.plistにてApp Transport Security SettingsとAllow Arbitrary LoadsをYESに設定、ドメイン制限も可能
        }.resume()
        
        
        
        
        
    }
    
    // メイン画面に遷移
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 会員登録画面に遷移
    @IBAction func moveToSignUp(_ sender: Any) {
        
        let signUpVC = UIStoryboard(name: "SignUpVC", bundle: nil).instantiateViewController(identifier: "signUpVC")
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
