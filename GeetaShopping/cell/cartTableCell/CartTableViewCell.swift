//
//  CartTableViewCell.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 06/02/22.
//

import UIKit


protocol CartTableViewCellDelegate{
    func countDetails(countPr:String?,index:Int?)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    var count = 1
    @IBOutlet weak var borderCount: UIView!
    
    
    
    var delegate:CartTableViewCellDelegate?
    
    var index:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borderCount.layer.borderWidth=1
        borderCount.layer.borderColor = UIColor.systemGray5.cgColor
        
    }

    @IBAction func minusPressed(_ sender: Any) {
        
        if countLbl.text != "1"{
            count -= 1
            countLbl.text = String(count)
        }
        delegate?.countDetails(countPr: countLbl.text, index: index?.row)

        
        
    }
    
    @IBAction func plusPressed(_ sender: Any) {
        count += 1
        countLbl.text = String(count)
        delegate?.countDetails(countPr: countLbl.text,index:index?.row)

    }
    
    
    func updateCell(info:Data){
        priceLbl.text = info.price
        countLbl.text = info.countData
    }
    
}
