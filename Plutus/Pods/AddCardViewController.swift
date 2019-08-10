//
//  AddCardViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 10/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import YRPayment

class AddCardViewController: UIViewController {

    
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var validityTF: UITextField!
    @IBOutlet weak var cvvTF: UITextField!
    @IBOutlet weak var cardView: UIView!
    
    
    let card = YRPaymentCreditCard(type: .masterCard)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let payment = YRPayment(creditCard: card)
        view.addSubview(card)
        card.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        card.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        payment.numberTextField = numberTF
        payment.holderNameTextField = nameTF
        payment.validityTextField = validityTF
        payment.cryptogramTextField = cvvTF
        // Do any additional setup after loading the view.
    }
    


}
