//
//  SuccessViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 07/02/22.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func backHomePressed(_ sender: Any) {
        let vc = ShopViewController(nibName: "ShopViewController", bundle: nil)
    
    }
    

}
