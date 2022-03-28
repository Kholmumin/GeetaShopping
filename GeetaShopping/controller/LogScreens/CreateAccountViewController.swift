//
//  CreateAccountViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 29/01/22.
//

import UIKit
import IQKeyboardManagerSwift
class CreateAccountViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView! {
        didSet {
            gradientView.backgroundColor = .red
        }
    }
    
    @IBOutlet weak var fullnameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var nameTxf: UITextField!{
        didSet{
            nameTxf.delegate = self
        }
    }
    @IBOutlet weak var emailTxf: UITextField!{
        didSet{
            emailTxf.delegate = self
        }
    }
    @IBOutlet weak var passwordTfx: UITextField!{
        didSet{
            passwordTfx.delegate = self
        }
    }
    
    let myColor1:UIColor=UIColor(red: 127/255, green: 119/255, blue: 254/255, alpha: 1)
    let myColor2:UIColor=UIColor(red: 165/255, green: 115/255, blue: 255/255, alpha: 1)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = true
        borders()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async { [self] in
            linearGradient()
        }
    }
    
  
    
    

    @IBAction func registerPressed(_ sender: Any) {
        let vc = UINavigationController(rootViewController: LogInViewController(nibName: "LogInViewController", bundle: nil))
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    func linearGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.type = .axial
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors=[myColor1.cgColor,myColor2.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    
    func borders(){
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.systemGray5.cgColor
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.systemGray5.cgColor
        fullnameView.layer.borderWidth = 1
        fullnameView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension CreateAccountViewController:UITextFieldDelegate{
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTxf{
            fullnameView.layer.borderColor = myColor1.cgColor
            fullnameView.layer.shadowOffset = .zero
            fullnameView.layer.shadowColor = myColor1.cgColor
            fullnameView.layer.shadowRadius = 5
            fullnameView.layer.shadowOpacity = 1
            fullnameView.clipsToBounds = false
            
        }else if textField == emailTxf{
            emailView.layer.borderColor = myColor1.cgColor
            emailView.layer.shadowOffset = .zero
            emailView.layer.shadowColor = myColor1.cgColor
            emailView.layer.shadowRadius = 5
            emailView.layer.shadowOpacity = 1
            emailView.clipsToBounds = false
        }else{
            passwordView.layer.borderColor = myColor1.cgColor
            passwordView.layer.shadowOffset = .zero
            passwordView.layer.shadowColor = myColor1.cgColor
            passwordView.layer.shadowRadius = 5
            passwordView.layer.shadowOpacity = 1
            passwordView.clipsToBounds = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == nameTxf{
            fullnameView.layer.borderColor = UIColor.systemGray5.cgColor
            fullnameView.layer.shadowRadius = 0
        }else if textField == emailTxf{
            emailView.layer.borderColor = UIColor.systemGray5.cgColor
            emailView.layer.shadowRadius = 0
        }else{
            passwordView.layer.borderColor = UIColor.systemGray5.cgColor
            passwordView.layer.shadowRadius = 0

        }
    }
    
}

