//
//  MainViewController.swift
//  Plutus
//
//  Created by Tushar Singh on 07/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import SwiftCharts
import Firebase
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var chartTable: UITableView!
    
    var stockJson = JSON()
    var stockCount = 0
    let advantageKey = "A6XGJN1FZIWPD5KZ"
    var allDataPoints = Dictionary<String, [String]>()
    var names = Dictionary<String,String>()
    var tickers=[String]()
    var net="",price="",change=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTickers()
        chartTable.backgroundColor = .clear
        chartTable.showsVerticalScrollIndicator=false
        collectionView.delegate = self
        collectionView.dataSource = self
        chartTable.delegate=self
        chartTable.dataSource=self
        chartTable.separatorStyle = .none
        chartTable.allowsSelection=false
//        getPlottingData(ticker: "MSFT")
//        getNetData(ticker: "MSFT")
    }
}

extension MainViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardViewCell
        return cell
    }
}

//MARK: - Networking

extension MainViewController{
    
    func getTickers(){
        var json = JSON()
        let ref = Database.database().reference().child("HomeStocks")
        ref.observe(.value) { (data) in
            json = JSON(data.value)
            for (key,subJson):(String,JSON) in json {
                self.tickers.append(key)
                self.names[key] = subJson.stringValue
            }
            self.chartTable.reloadData()
        }
    }
    
    func getPlottingData(ticker:String)->[String]{
        var parameters:[String:String] = ["function":"TIME_SERIES_INTRADAY",
                                          "symbol":ticker,
                                          "interval":"60min",
                                          "apikey":advantageKey]
        var dataPoints = [String]()
        Alamofire.request(URL(string: "https://www.alphavantage.co/query")!, method: .get
            , parameters: parameters).responseJSON { (response) in
                if response.result.isSuccess{
                    self.stockJson = JSON(response.result.value)
                    self.stockCount = self.stockJson["Time Series (60min)"].count
                    print("SUCCESS")
                    for(_,subJson):(String,JSON) in self.stockJson["Time Series (60min)"]{
                        dataPoints.append(subJson["2. high"].stringValue)
                    }
                    self.allDataPoints[ticker] = dataPoints
                }else{
                    print("FAILURE")
                }
        }
        return dataPoints
    }
    
    func getNetData(ticker:String)->(net:String,price:String,change:String){
        var net = ""
        var price=""; var changeVal = 0; var change = ""
        var parameters:[String:String] = ["function":"GLOBAL_QUOTE",
                                          "symbol":ticker,
                                          "apikey":advantageKey]
        Alamofire.request(URL(string: "https://www.alphavantage.co/query")!, method: .get, parameters: parameters).responseJSON { (data) in
            if data.result.isSuccess{
                var json = JSON(data.result.value)
                print(json)
                net = json["Global Quote"]["10. change percent"].stringValue
                price = json["Global Quote"]["05. price"].stringValue
                changeVal = json["Global Quote"]["09. change"].intValue
                if changeVal>0{
                    change = "Sell"
                }else{
                    change = "Hold"
                }
            };print("NETT",net)
           
        }
        return (net,price,change)
    }
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tickers.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: chartTable.frame.width, height: 10)
        v.backgroundColor = .clear
        return v
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chartTable.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath) as! ChartTableViewCell
        
        
        cell.stockNameLabel.text = names[tickers[indexPath.section]]
        cell.stockTickLabel.text = tickers[indexPath.section]
        cell.stockPriceLabel.text = price
        cell.stockNetLabel.text = net
        cell.stockHoldLabel.text = change
        print(net,price,change,indexPath.section)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
