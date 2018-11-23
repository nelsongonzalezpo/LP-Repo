//
//  ViewController.swift
//  LP-Exercise
//
//  Created by Nelson Gonzalez on 11/22/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var naleLabel: UILabel!
    
    
    
    let prueba: [Int] = [0,1,2]

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var objetos: [[String: Any]] = [[:]]
    var nombres: [Any] = []
    var precios: [Any] = []
    var rebajaPrecios: [Any] = []

    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtenerDatos()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func obtenerDatos(){
        
    
    
    //let firstPart: String = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string"
    //let search: String = readLine()!
    //let secondPart: String = "&page-number=1"
    
    let API = request("https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string=lavadora&page-number=1").responseJSON { (datas) in
        
        
        if let jsonData = datas.result.value{
            
            let jsonObject: Dictionary = jsonData as! Dictionary<String, Any>
            
            let jsonProduct: Dictionary = jsonObject["status"] as! Dictionary<String, Any>
            let jsonProduct2: Dictionary = jsonObject["plpResults"] as! Dictionary<String, Any>
            
            let jsonProduct3: [[String: Any]] = jsonProduct2["records"] as! [[String: Any]]
            
            
            for elements in 0...jsonProduct3.count-1{
                print("El elemento", elements, "\(jsonProduct3[elements])")
                self.objetos.append(jsonProduct3[elements])
                
                let productListName = jsonProduct3[elements]["productDisplayName"]! as Any
                let listPrice = jsonProduct3[elements]["listPrice"]! as Any
                let minimumPromoPrice = jsonProduct3[elements]["minimumPromoPrice"]! as Any
                let smImage: UIImage
                
                
                //print(elements, nombre)
                self.nombres.append(productListName)
                self.precios.append(listPrice)
                self.rebajaPrecios.append(minimumPromoPrice)

                //self.nameLabel.text = jsonProduct3[elements]["productDisplayName"] as! String
            }
            
            print("ProductNames")
            print(self.nombres)
            print(self.nombres.count)
            self.tableView.reloadData()

            
            //let productDisplayName = jsonProduct3[["smImage": "https://ss634.liverpool.com.mx/sm/1077576114.jpg"]]
//            let listPrice: Int = 0
//            let minimumPromoPrice: Int = 0
//            let smImage: UIImage
//            let variantsColors : [String] = []
            
    }

        //print(self.objetos)
        //print(self.objetos.count)
            

            
           // print(jsonProduct3)
            
            
        }
        
        //print(datas)
    }
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! ViewControllerTableViewCell
        //cell?.textLabel?.text = postData[indexPath.row]
        cell.myName.text = "\(nombres[indexPath.row])"
        cell.oldPrice.text = "\(precios[indexPath.row])"
        cell.newPrice.text = "\(rebajaPrecios[indexPath.row])"


        //print("The cell \(cell!)")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }




}

