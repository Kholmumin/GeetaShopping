//
//  FindProductViewController.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 07/02/22.
//

import UIKit

class FindProductViewController: UIViewController {
    @IBOutlet weak var searchCollection: UICollectionView!{
        didSet{
            searchCollection.delegate = self
            searchCollection.dataSource = self
            searchCollection.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         title="Find Products"

    }
}

extension FindProductViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width/2-20, height: (UIScreen.main.bounds.width/2-10)*27/17)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
}
