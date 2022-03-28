//
//  MyCartViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 06/02/22.
//

import UIKit

struct Data{
    var countData:String
    var price:String
}

class MyCartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!{
        didSet{
            cartTableView.delegate = self
            cartTableView.dataSource = self
            cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        }
    }
    
    
    var datas:[Data]=[
        Data(countData: "1", price: "12"),
        Data(countData: "1", price: "13"),
        Data(countData: "1", price: "14"),
        Data(countData: "1", price: "15"),
        Data(countData: "1", price: "16"),
        Data(countData: "1", price: "17"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Cart"
    }
    
    
    @IBAction func checkOutPressed(_ sender: Any) {
        
        let vc = PlaceOrderViewController(nibName: "PlaceOrderViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

//MARK: TABLE VIEW

extension MyCartViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        cell.updateCell(info: datas[indexPath.row])
        cell.delegate = self
        cell.index = indexPath
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
   
    
}

extension MyCartViewController:CartTableViewCellDelegate{
    func countDetails(countPr: String?, index: Int?) {
        datas[index!].countData = countPr!
    }
    
    
}
