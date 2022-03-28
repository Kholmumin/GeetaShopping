//
//  HomeViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 19/01/22.
//

import UIKit
import IQKeyboardManagerSwift   
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        IQKeyboardManager.shared.enable = true
    }


    @IBAction func shopNowPressed(_ sender: Any) {
        
        let vc = IntroViewController(nibName: "IntroViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
