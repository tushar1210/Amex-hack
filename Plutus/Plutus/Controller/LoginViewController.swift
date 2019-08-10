//
//  LoginViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 04/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Lottie
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    let animationView = AnimationView(name: "coins")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationView()
        passwordTF.isSecureTextEntry = true
    }
    
    func addAnimationView(){
        animationView.frame = CGRect(x: 100.5, y:400, width: 200, height: 200)
        animationView.center.x = self.view.center.x
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 3
        self.view.addSubview(animationView)
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        if(emailTF.text != "" && passwordTF.text != "" ){
            animationView.play { (finished) in
                self.performSegue(withIdentifier: "1", sender: nil)
            }
        }else{
            let alert = UIAlertController(title: "Incomplete Credentials", message: "Please enter both Email and Password fields.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

