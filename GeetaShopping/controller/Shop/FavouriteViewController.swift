//
//  FavouriteViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 07/02/22.
//

import UIKit

class FavouriteViewController: UIViewController {
    @IBOutlet weak var cartbtn: UIButton!
    @IBOutlet weak var favouriteTable: UITableView!{
        didSet{
            favouriteTable.delegate = self
            favouriteTable.dataSource = self
            favouriteTable.register(UINib(nibName: "FavouriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouriteTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favourite"
    }
    
    
    
    @IBAction func addToCardPressed(_ sender: Any) {
        
        let vc = PlaceOrderViewController(nibName: "PlaceOrderViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    

    
}
extension FavouriteViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favouriteTable.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    
    
    
}
