//
//  MainVC.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 27.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    // Outlets
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signupNameTextField: UITextField!
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var signupPasswordTextField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var loginActivitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var signupActivitySpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var signupView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizer()
        
        loginActivitySpinner.isHidden = true
        signupActivitySpinner.isHidden = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Methods
    func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapHandler() {
        view.endEditing(true)
    }
    
    // Actions
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let emailText = loginEmailTextField.text, loginEmailTextField.text != "" else { return }
        guard let passwordText = loginPasswordTextField.text, loginPasswordTextField.text != "" else { return }
        
        loginBtn.isEnabled = false
        
        loginActivitySpinner.startAnimating()
        loginActivitySpinner.isHidden = false
        
        AuthService.instance.login(usingEmail: emailText, andPassword: passwordText) { (success) in
            if success {
                self.loginActivitySpinner.stopAnimating()
                
                guard let fetchVC = self.storyboard?.instantiateViewController(withIdentifier: FETCH_VC) else { return }
                self.present(fetchVC, animated: false, completion: nil)
            } else {
                let alert = UIAlertController(title: "Whoops...", message: "Incorrect email or password", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.loginActivitySpinner.stopAnimating()
                self.loginActivitySpinner.isHidden = true
                self.loginEmailTextField.text = ""
                self.loginPasswordTextField.text = ""
            }
        }
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        guard let nameText = signupNameTextField.text, signupNameTextField.text != "" else { return }
        guard let emailText = signupEmailTextField.text, signupEmailTextField.text != "" else { return }
        guard let passwordText = signupPasswordTextField.text, signupPasswordTextField.text != "" else { return }
        
        signupBtn.isEnabled = false
        
        signupActivitySpinner.startAnimating()
        signupActivitySpinner.isHidden = false
        
        AuthService.instance.signup(usingName: nameText, andEmail: emailText, andPassword: passwordText) { (success) in
            if success {
                self.signupActivitySpinner.stopAnimating()
                
                guard let fetchVC = self.storyboard?.instantiateViewController(withIdentifier: FETCH_VC) else { return }
                self.present(fetchVC, animated: false, completion: nil)
            } else {
                let alert = UIAlertController(title: "Whoops...", message: "Make sure that the email is valid and the password contains at least 5 characters.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.signupActivitySpinner.stopAnimating()
                self.signupActivitySpinner.isHidden = true
                self.signupNameTextField.text = ""
                self.signupEmailTextField.text = ""
                self.signupPasswordTextField.text = ""
            }
        }
    }
    
    @IBAction func toSignupBtnPressed(_ sender: Any) {
        signupView.isHidden = false
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        signupView.isHidden = true
    }
}

