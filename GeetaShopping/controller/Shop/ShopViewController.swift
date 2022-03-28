//
//  ShopViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 29/01/22.
//

import UIKit
import SideMenuSwift


struct HeaderData {
    var name: String
    var isSelect: Bool
}

class ShopViewController: UIViewController {

    
    
    @IBOutlet weak var secondCollection: UICollectionView!{
        didSet{
            secondCollection.delegate = self
            secondCollection.dataSource = self
            secondCollection.register(UINib(nibName: "ClothCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClothCollectionViewCell")
        }
    }
    
    
    var data: [HeaderData] = [
        HeaderData(name: "Popular", isSelect: true),
        HeaderData(name: "Mens", isSelect: false),
        HeaderData(name: "Womens", isSelect: false),
        HeaderData(name: "Sale", isSelect: false),
    ]
    
    let widthOfCell = UIScreen.main.bounds.width/4-10
    
    @IBOutlet weak var widthOfAnimatableView: NSLayoutConstraint! {
        didSet {
            widthOfAnimatableView.constant = 20
        }
    }
    @IBOutlet weak var animaTableLine: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!{
        didSet{
            myCollectionView.delegate = self
            myCollectionView.dataSource = self
            myCollectionView.register(UINib(nibName: "ShopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShopCollectionViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSettings()
        title = ""
        
        SideMenuController.preferences.basic.menuWidth = 300
        SideMenuController.preferences.basic.direction = .right
        SideMenuController.preferences.basic.position = .sideBySide
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.supportedOrientations = .portrait
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    
    func navigationSettings(){
        //title = "Geeta."
        let alertBtn = UIBarButtonItem(image: UIImage(named: "img14"), style: .done, target: self, action: nil)
        let shopBtn=UIBarButtonItem(image: UIImage(named: "img13"), style: .done, target: self, action: nil)
        
        let favouriteBtn = UIBarButtonItem(image: UIImage(named: "img15"), style: .done, target: self, action: #selector(goFavouritePage))
      
        let search = UIBarButtonItem(image: UIImage(named: "img12"), style: .done, target: self, action: #selector(goSearchPage))
        let menuBtn=UIBarButtonItem(image: UIImage(named: "img10"), style: .done, target: self, action: #selector(menuPressed))
        navigationItem.rightBarButtonItems=[
            menuBtn,search,favouriteBtn,shopBtn,alertBtn,
        ]
        
        let mylabel = UILabel()
        mylabel.text = "Geeta."
        mylabel.font = .systemFont(ofSize: 100)
        let myTitle = mylabel.text
        let leadingbtn = UIBarButtonItem(title: myTitle, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItems=[leadingbtn]
    }
    
    
    @objc func goSearchPage(){
        let vc = FindProductViewController(nibName: "FindProductViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goFavouritePage(){
        let vc = FavouriteViewController(nibName: "FavouriteViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func menuPressed(){
//    let vc = ProfileViewController(nibName: "ProfileViewController", bundle:nil)
//    self.navigationController?.pushViewController(vc, animated: true)
//        let vc1 = SideMenuController(contentViewController: self, menuViewController: vc)
        sideMenuController?.revealMenu()
//
        
//        self.sideMenuController?.revealMenu()
    }
    
}

//MARK: Collection
extension ShopViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == myCollectionView{
            return data.count
        }else{
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myCollectionView {
            guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell", for: indexPath) as? ShopCollectionViewCell else { return UICollectionViewCell() }
            cell.updateCell(data: data[indexPath.row])
            return cell
        } else {

            guard let cell = secondCollection.dequeueReusableCell(withReuseIdentifier: "ClothCollectionViewCell", for: indexPath) as? ClothCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
            
        }
         
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == myCollectionView{
            return   CGSize(width: widthOfCell, height: ((UIScreen.main.bounds.width/4)-30)*28/33)

        }else{
            return CGSize(width: UIScreen.main.bounds.width/2-30, height: (UIScreen.main.bounds.width/2-30)*27/16+15)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == myCollectionView {
            for dt in data.enumerated() {
                data[dt.offset].isSelect = false
            }
            data[indexPath.row].isSelect = true
            collectionView.reloadData()
        } else {
            let vc = ClothDetailsViewController(nibName: "ClothDetailsViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
