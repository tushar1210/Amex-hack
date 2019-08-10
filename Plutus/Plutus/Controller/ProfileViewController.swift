//
//  ProfileViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 09/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var transactionTable: UITableView!
   
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        transactionTable.delegate=self
        transactionTable.dataSource=self
        transactionTable.backgroundColor = .clear
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func addCard(_ sender: Any) {
    }
}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v=UIView()
        v.backgroundColor = .clear
        return v
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}



