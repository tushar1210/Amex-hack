//
//  SearchViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 09/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tickerTF: UITextField!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var suggestedCollectionView: UICollectionView!
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestedCollectionView.delegate = self
        favouriteCollectionView.delegate = self
        suggestedCollectionView.dataSource = self
        favouriteCollectionView.dataSource=self
    }
    


    @IBAction func go(_ sender: Any) {
    }
}


extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.favouriteCollectionView{
            return 3
        }
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.suggestedCollectionView{
            let cell = suggestedCollectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedCell", for: indexPath) as! SuggestedCollectionViewCell
            return cell
        }
        else{
            let cell = favouriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as! FavouriteCollectionViewCell
            return cell
        }
        
    }
    
    
    
}
