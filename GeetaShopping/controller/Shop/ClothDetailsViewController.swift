//
//  ClothDetailsViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 02/02/22.
//

import UIKit

class ClothDetailsViewController: UIViewController {

    let myColor1:UIColor=UIColor(red: 99/255, green: 66/255, blue: 232/255, alpha: 1)
    let myColor2:UIColor=UIColor(red: 241/255, green: 244/255, blue: 251/255, alpha: 1)

    @IBOutlet weak var xlBtn: UIButton!
    @IBOutlet weak var xxlBtn: UIButton!
    @IBOutlet weak var lBtn: UIButton!
    @IBOutlet weak var mBtn: UIButton!
    @IBOutlet weak var sBtn: UIButton!
    @IBOutlet weak var myScrollView: UIScrollView!{
        didSet{
            myScrollView.layer.cornerRadius = 30
            
            myScrollView.clipsToBounds = true
            myScrollView.layer.maskedCorners=[
                .layerMaxXMinYCorner,
                .layerMinXMinYCorner
            ]
        }
    }
    @IBOutlet weak var addCountView: UIView!{
        didSet{
            addCountView.layer.borderWidth = 1
            addCountView.layer.borderColor = UIColor.systemGray5.cgColor
        }
    }
    var count = 1
    @IBOutlet weak var countlbl: UILabel!
    @IBOutlet weak var clothDetailCollection: UICollectionView!{
        didSet{
            clothDetailCollection.delegate = self
            clothDetailCollection.dataSource = self
            clothDetailCollection.register(UINib(nibName: "ClothDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClothDetailCollectionViewCell")
            clothDetailCollection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.green
        
        
        let heart = UIBarButtonItem(image: UIImage(named: "img15"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems=[heart]
        
    }
    
    
    @IBAction func minusCountBtn(_ sender: Any) {
        if countlbl.text! > "1"{
            count -= 1
            countlbl.text = String(count)
        }
    }
    
    @IBAction func plusCountbtn(_ sender: Any) {
        count += 1
        countlbl.text = String(count)
    }
    
    
    @IBAction func addToCartPressed(_ sender: Any) {
        let vc = MyCartViewController(nibName: "MyCartViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        
    }
    
    
    @IBAction func sPressed(_ sender: Any) {
        sBtn.backgroundColor = myColor1
        sBtn.setTitleColor(UIColor.white, for: .normal)
        
        mBtn.backgroundColor = myColor2
        mBtn.setTitleColor(UIColor.black, for: .normal)
        
        lBtn.backgroundColor = myColor2
        lBtn.setTitleColor(UIColor.black, for: .normal)
        
        xlBtn.backgroundColor = myColor2
        xlBtn.setTitleColor(UIColor.black, for: .normal)
        
        xxlBtn.backgroundColor = myColor2
        xxlBtn.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    
    @IBAction func mPressed(_ sender: Any) {
        
        
        mBtn.backgroundColor = myColor1
        mBtn.setTitleColor(UIColor.white, for: .normal)
        
        sBtn.backgroundColor = myColor2
        sBtn.setTitleColor(UIColor.black, for: .normal)
        
        lBtn.backgroundColor = myColor2
        lBtn.setTitleColor(UIColor.black, for: .normal)
        
        xlBtn.backgroundColor = myColor2
        xlBtn.setTitleColor(UIColor.black, for: .normal)
        
        xxlBtn.backgroundColor = myColor2
        xxlBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    @IBAction func lPressed(_ sender: Any) {
        lBtn.backgroundColor = myColor1
        lBtn.setTitleColor(UIColor.white, for: .normal)
        
        sBtn.backgroundColor = myColor2
        sBtn.setTitleColor(UIColor.black, for: .normal)
        
        mBtn.backgroundColor = myColor2
        mBtn.setTitleColor(UIColor.black, for: .normal)
        
        xlBtn.backgroundColor = myColor2
        xlBtn.setTitleColor(UIColor.black, for: .normal)
        
        xxlBtn.backgroundColor = myColor2
        xxlBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func xlPressed(_ sender: Any) {
        xlBtn.backgroundColor = myColor1
        xlBtn.setTitleColor(UIColor.white, for: .normal)
        
        sBtn.backgroundColor = myColor2
        sBtn.setTitleColor(UIColor.black, for: .normal)
        
        mBtn.backgroundColor = myColor2
        mBtn.setTitleColor(UIColor.black, for: .normal)
        
        lBtn.backgroundColor = myColor2
        lBtn.setTitleColor(UIColor.black, for: .normal)
        
        xxlBtn.backgroundColor = myColor2
        xxlBtn.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    
    @IBAction func xxlPressed(_ sender: Any) {
        xxlBtn.backgroundColor = myColor1
        xxlBtn.setTitleColor(UIColor.white, for: .normal)
        
        sBtn.backgroundColor = myColor2
        sBtn.setTitleColor(UIColor.black, for: .normal)
        
        mBtn.backgroundColor = myColor2
        mBtn.setTitleColor(UIColor.black, for: .normal)
        
        lBtn.backgroundColor = myColor2
        lBtn.setTitleColor(UIColor.black, for: .normal)
        
        xlBtn.backgroundColor = myColor2
        xlBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
}


//MARK: COLLECTION VIEW

extension ClothDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothDetailCollectionViewCell", for: indexPath) as? ClothDetailCollectionViewCell else { return UICollectionViewCell()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: clothDetailCollection.frame.height - 1)
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}


