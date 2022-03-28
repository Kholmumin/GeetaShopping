//
//  PlaceOrderViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 07/02/22.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    @IBOutlet weak var placeOrderView: UIView!{
        didSet{
            placeOrderView.clipsToBounds = true
            placeOrderView.layer.cornerRadius = 30
            placeOrderView.layer.maskedCorners = [
                .layerMaxXMinYCorner,
                .layerMinXMinYCorner
            ]
            
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    
    
    @IBAction func placeOrderPressed(_ sender: Any) {
        let vc = CreditViewController(nibName: "CreditViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}



