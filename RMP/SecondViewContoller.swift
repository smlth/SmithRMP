import UIKit

class SecondViewController: UIViewController {
    
    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.frame = CGRect(x: 175, y: 150, width: 50, height: 50)
        loginLabel.textColor = .lightGray
        loginLabel.font = loginLabel.font.withSize(20)
        return loginLabel
    }()
    
    private let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.frame = CGRect(x: 105, y: 190, width: 200, height: 35)
        loginTextField.backgroundColor = .darkGray
        loginTextField.textColor = .white
        loginTextField.font = UIFont(name: "Proxima Nova", size: 20)
        loginTextField.layer.cornerRadius = 5
        return loginTextField
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "E-mail"
        emailLabel.frame = CGRect(x: 175, y: 235, width: 100, height: 50)
        emailLabel.textColor = .lightGray
        emailLabel.font = emailLabel.font.withSize(20)
        return emailLabel
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 105, y: 275, width: 200, height: 35)
        emailTextField.backgroundColor = .darkGray
        emailTextField.textColor = .white
        emailTextField.font = UIFont(name: "Proxima Nova", size: 20)
        emailTextField.layer.cornerRadius = 5
        return emailTextField
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
    passwordLabel.text = "Password"
    passwordLabel.frame = CGRect(x: 160, y: 320, width: 100, height: 50)
    passwordLabel.textColor = .lightGray
    passwordLabel.font = passwordLabel.font.withSize(20)
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 105, y: 360, width: 200, height: 35)
        passwordTextField.backgroundColor = .darkGray
        passwordTextField.textColor = .white
        passwordTextField.font = UIFont(name: "Proxima Nova", size: 20)
        passwordTextField.layer.cornerRadius = 5
        return passwordTextField
    }()
    
    private let repeatpasswordLabel: UILabel = {
        let repeatpasswordLabel = UILabel()
        repeatpasswordLabel.text = "Repeat password"
        repeatpasswordLabel.frame = CGRect(x: 130, y: 395, width: 185, height: 50)
        repeatpasswordLabel.textColor = .lightGray
        repeatpasswordLabel.font = repeatpasswordLabel.font.withSize(20)
        return repeatpasswordLabel
    }()
    
    private let repeatpasswordTextField: UITextField = {
        let repeatpasswordTextField = UITextField()
        repeatpasswordTextField.frame = CGRect(x: 105, y: 435, width: 200, height: 35)
        repeatpasswordTextField.backgroundColor = .darkGray
        repeatpasswordTextField.textColor = .white
        repeatpasswordTextField.font = UIFont(name: "Proxima Nova", size: 20)
        repeatpasswordTextField.layer.cornerRadius = 5
        return repeatpasswordTextField
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
    
    @objc func registrationButtonAction(_ sender: UIButton) {
        var login: String? = nil
        var email: String? = nil
        var password: String? = nil
        
        if loginTextField.text?.isEmpty == true {
            animateError(view: loginTextField)
        } else {
            login = loginTextField.text!
        }
        
        if emailTextField.text?.isEmpty == true {
            animateError(view: emailTextField)
        } else {
            if emailTextField.text!.contains("@") == true {
                email = emailTextField.text!
            } else {
                animateError(view: emailTextField)
            }
               }
        
        if passwordTextField.text?.isEmpty == true {
            animateError(view: passwordTextField)
        } else {
            password = passwordTextField.text!
        }
    
        if repeatpasswordTextField.text?.isEmpty == true ||
             passwordTextField.text != repeatpasswordTextField.text {
            animateError(view: repeatpasswordTextField)
        }
        
        guard login != nil && email != nil && password != nil && password == repeatpasswordTextField.text else {
            return
        }

        
        UserDefaults.standard.set(login, forKey: "login")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        
        navigationController?.pushViewController(WelcomeViewController(), animated: true)
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
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
           view.addGestureRecognizer(tapGestureRecognizer)
        
        view.backgroundColor = .systemFill
        setupUI()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func setupUI(){
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(repeatpasswordLabel)
        view.addSubview(repeatpasswordTextField)
        view.addSubview(registrationButton)
    }

    
}
