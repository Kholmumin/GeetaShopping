//
//  ShopCollectionViewCell.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 01/02/22.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    let myColor1:UIColor=UIColor(red: 127/255, green: 119/255, blue: 254/255, alpha: 1)
    
    @IBOutlet weak var underLine: UIView!
    @IBOutlet weak var myLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func updateCell(data: HeaderData){
        myLbl.text = data.name
        underLine.isHidden = !data.isSelect
        if data.isSelect {
            myLbl.textColor = myColor1
        }else{
            myLbl.textColor = UIColor.systemGray
        }
    }
    
}
