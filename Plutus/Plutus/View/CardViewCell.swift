//
//  CardViewCell.swift
//  
//
//  Created by Tushar Singh on 08/08/19.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var deposit: UIButton!
    @IBOutlet weak var withdraw: UIButton!
    
	let one = ["355c7d","b92b27","f12711","f27121","ff00cc"]
	let two = ["c06c84","1565c0","f5af19","8a2387","333399"]
	let r1:[CGFloat] = [53,185,241,242,255,192,21,245,138,51]
	let g1:[CGFloat] = [92,43,39,113,0,108,101,175,35,51]
	let b1:[CGFloat] = [125,39,17,33,204,132,192,25,135,153]
	
	override func awakeFromNib() {
        //self.contentView.backgroundColor = .black
        self.backgroundColor = .clear
		self.backgroundView?.backgroundColor = .clear
        self.layer.cornerRadius = 14
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
    	self.deposit.layer.cornerRadius = 3
		self.withdraw.layer.cornerRadius = 3
		setGradientBackground()
    }
	func setGradientBackground() {
		let r = Int.random(in: 3...4)

		let gradientColor1 = UIColor(red: r1[r]/255, green: g1[r]/255, blue: b1[r]/255, alpha: 1).cgColor
		let gradientColor2 = UIColor(red: r1[r+5]/255, green: g1[r+5]/255, blue: b1[r+5]/255, alpha: 1).cgColor
		
		
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [gradientColor1, gradientColor2]
		gradientLayer.locations = [0, 1]
		gradientLayer.startPoint = CGPoint(x:0,y:0.5)
		gradientLayer.endPoint = CGPoint(x:1,y:0.5)
		gradientLayer.frame = self.contentView.bounds
		
		self.contentView.layer.insertSublayer(gradientLayer, at:0)
	}
    @IBAction func withdraw(_ sender: Any) {
        
    }
    
    @IBAction func deposit(_ sender: Any) {
        
        
    }
}

extension UIColor {
	public convenience init?(hex: String) {
		let r, g, b, a: CGFloat
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}
		
		return nil
	}
}

//let gold = UIColor(hex: "#ffe700ff")
