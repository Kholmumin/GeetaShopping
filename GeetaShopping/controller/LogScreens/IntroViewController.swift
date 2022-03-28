//
//  IntroViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 19/01/22.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var lobInbtn: UIButton!{
        didSet{
            lobInbtn.layer.borderWidth = 2
            lobInbtn.layer.cornerRadius = 27
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        navigationController?.navigationBar.isHidden = true
        
    }
    

    @IBAction func logInPressed(_ sender: Any) {
        
        let vc = LogInViewController(nibName: "LogInViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func registerPressed(_ sender: Any) {
        let vc = CreateAccountViewController(nibName: "CreateAccountViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
