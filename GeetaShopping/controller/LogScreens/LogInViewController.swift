//
//  LogInViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 19/01/22.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxf: UITextField! {
        didSet {
            emailTxf.delegate = self
        }
    }
    @IBOutlet weak var errorImage: UIImageView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var passWordTF: UITextField! {
        didSet {
            passWordTF.delegate = self
        }
    }
    
    
    let myColor1:UIColor=UIColor(red: 127/255, green: 119/255, blue: 254/255, alpha: 1)
    let myColor2:UIColor=UIColor(red: 165/255, green: 115/255, blue: 255/255, alpha: 1)
    
    
    var count = 2

    override func viewDidLoad() {
        super.viewDidLoad()


        borderColors()
        checkImg.isHidden = true
        navigationController?.isToolbarHidden = true
        navigationController?.title = ""
        title = ""
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        linearGradient()
    }

    
    func borderColors(){
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.systemGray5.cgColor
        errorImage.isHidden = false
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.systemGray5.cgColor

        checkView.layer.borderWidth = 1
        checkView.layer.borderColor = UIColor.systemGray5.cgColor
        checkView.layer.cornerRadius = 4

    }

    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func linearGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.type = .axial
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors=[myColor1.cgColor,myColor2.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }

    @IBAction func checkButtonPressed(_ sender: Any) {
        if count % 2 == 0{
            checkImg.isHidden = false
        }else{
            checkImg.isHidden = true
        }
        count+=1
    }

    @IBAction func logInPressed(_ sender: Any) {
        
        
        let window = UIApplication.shared.keyWindow
        window?.rootViewController = UINavigationController(rootViewController: ShopViewController(nibName: "ShopViewController", bundle: nil))
        window?.makeKeyAndVisible()
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        let vc = CreateAccountViewController(nibName: "CreateAccountViewController", bundle: nil)
    
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
   
    
}


extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTxf {
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTxf {
            emailView.layer.borderColor = UIColor.systemGray5.cgColor
            emailView.layer.shadowRadius = 0
        }else{
            passwordView.layer.borderColor = UIColor.systemGray5.cgColor
            passwordView.layer.shadowRadius = 0

        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
   
        if textField == emailTxf {
            if (string == ("@")){
                errorImage.isHidden = true
            }else{
                errorImage.isHidden = false
            }
        }
        return true
    }
    
}
