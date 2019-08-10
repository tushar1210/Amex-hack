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
        go.layer.cornerRadius = 10
        suggestedCollectionView.delegate = self
        favouriteCollectionView.delegate = self
        suggestedCollectionView.dataSource = self
        favouriteCollectionView.dataSource=self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var obj = PreviewViewController()
        obj.ticker = tickerTF.text!
    }

    @IBAction func go(_ sender: Any) {
        if tickerTF.text != ""{
            performSegue(withIdentifier: "search", sender: nil)
        }
    }
}


extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.favouriteCollectionView{
            return 5
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.suggestedCollectionView{
            let cell = suggestedCollectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedCell", for: indexPath) as! SuggestedCollectionViewCell
            cell.prizeLabel.text = stovalue[indexPath.row]
            cell.tickerImageView.image = UIImage(named: ticker[indexPath.row])
            cell.tickerLabel.text = companyName[indexPath.row]
            return cell
        }
        else{
            let cell = favouriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as! FavouriteCollectionViewCell
            cell.priceLabel.text = stovalue[indexPath.row+5]
            cell.tickerImageView.image = UIImage(named: ticker[indexPath.row+5])
            cell.tickerLabel.text = companyName[indexPath.row+5]
            return cell

        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
