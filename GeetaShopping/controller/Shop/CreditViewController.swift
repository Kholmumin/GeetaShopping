//
//  CreditViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 07/02/22.
//

import UIKit

class CreditViewController: UIViewController {

    @IBOutlet weak var masterCardView: UIView!{
        didSet{
            masterCardView.layer.borderWidth = 1
            masterCardView.layer.borderColor = UIColor.systemGray5.cgColor
        }
    }
    @IBOutlet weak var cvcView: UIView!{
        didSet{
            cvcView.layer.borderWidth = 1
            cvcView.layer.borderColor = UIColor.systemGray5.cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Credit / Debit Card"
    }

    @IBAction func useCardPressed(_ sender: Any) {
        
        let vc = SuccessViewController(nibName: "SuccessViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    

}
