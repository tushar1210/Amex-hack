//
//  PreviewViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 10/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import AlamofireImage
class PreviewViewController: UIViewController {
    
    var ticker = ""
    
    @IBOutlet weak var resultImage: UIImageView!
    
    let url = URL(string :"https://stocks-api-amex.herokuapp.com/plot.png")
    var im = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        


        Alamofire.request(url!, method: .post, parameters: ["company":ticker.capitalized], encoding: JSONEncoding.default, headers: nil).responseImage{ (response) in
            if let image1 = response.result.value {
                self.resultImage.image = image1
            
            }else{
                print("OOF")
            }
        }
        // Do any additional setup after loading the view.
    }
    

   

}
