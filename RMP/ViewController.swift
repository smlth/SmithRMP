//
//  ViewController.swift
//  RMP
//
//  Created by Smith on 09.12.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.frame = CGRect(x: 175, y: 225, width: 50, height: 50)
        loginLabel.textColor = .lightGray
        loginLabel.font = loginLabel.font.withSize(20)
        return loginLabel
    }()
    
    private let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.frame = CGRect(x: 105, y: 265, width: 200, height: 35)
        loginTextField.backgroundColor = .darkGray
        loginTextField.textColor = .white
        loginTextField.font = UIFont(name: "Proxima Nova", size: 20)
        loginTextField.layer.cornerRadius = 5
        return loginTextField
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
    passwordLabel.text = "Password"
    passwordLabel.frame = CGRect(x: 160, y: 310, width: 100, height: 50)
    passwordLabel.textColor = .lightGray
    passwordLabel.font = passwordLabel.font.withSize(20)
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 105, y: 350, width: 200, height: 35)
        passwordTextField.backgroundColor = .darkGray
        passwordTextField.textColor = .white
        passwordTextField.font = UIFont(name: "Proxima Nova", size: 20)
        passwordTextField.layer.cornerRadius = 5
        return passwordTextField
    }()
    
    
    private let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.setTitle("Registration", for: .normal)
        registrationButton.frame = CGRect(x: 105, y: 650, width: 200, height: 45)
        registrationButton.backgroundColor = .systemBlue
        registrationButton.layer.cornerRadius = 8
        registrationButton.addTarget(self, action: #selector(registrationButtonAction), for: .touchUpInside)
        return registrationButton
        
    }()
    
    private let loginButton: UIButton = {
        let loginButtonButton = UIButton()
        loginButtonButton.setTitle("Login", for: .normal)
        loginButtonButton.frame = CGRect(x: 105, y: 590, width: 200, height: 45)
        loginButtonButton.backgroundColor = .systemBlue
        loginButtonButton.layer.cornerRadius = 8
        loginButtonButton.addTarget(self, action: #selector(loginButtonButtonAction), for: .touchUpInside)
        return loginButtonButton
        
    }()
    
    @objc func registrationButtonAction(_ sender: UIButton) {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    @objc func loginButtonButtonAction(_ sender: UIButton) {
        let loginCheck:Optional = UserDefaults.standard.string(forKey: "login")
        let passwordCheck:Optional = UserDefaults.standard.string(forKey: "password")
        
        if loginTextField.text?.isEmpty == true ||
           passwordTextField.text?.isEmpty == true ||
           loginTextField.text != loginCheck  ||
           passwordTextField.text != passwordCheck {
           animateError(view: loginTextField)
           animateError(view: passwordTextField)
        } else {
            navigationController?.pushViewController(WelcomeViewController(), animated: true)
        }
    }
    
    
    func animateError(view: UITextField) {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
            view.backgroundColor = .systemRed
        }, completion: {(finish : Bool) in
            UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
                view.backgroundColor = .darkGray })})
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
           view.addGestureRecognizer(tapGestureRecognizer)
        
        view.backgroundColor = .systemFill
        setupUI()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func setupUI(){
        view.addSubview(loginTextField)
        view.addSubview(loginLabel)
        view.addSubview(loginButton)
        view.addSubview(registrationButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
    }
    
}

