//
//  ViewController.swift
//  LP-Exercise
//
//  Created by Nelson Gonzalez on 11/22/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    

    var objetos: [[String: Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtenerDatos()
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
            //let jsonProduct4: [[String: Any]] = jsonProduct3 as! [[String: Any]]
            //let jsonProduct4: Dictionary = jsonProduct3["sortOptions"] as! Dictionary<String, Any>
            //let jsonProduct5: Dictionary = jsonProduct4["records"] as! Dictionary<String, Any>
            
            for elements in 0...jsonProduct3.count-1{
               // print("El elemento \(jsonProduct3[elements])")
                self.objetos.append(jsonProduct3[elements])
            }
            
            //let productDisplayName = jsonProduct3[["smImage": "https://ss634.liverpool.com.mx/sm/1077576114.jpg"]]
            let listPrice: Int = 0
            let minimumPromoPrice: Int = 0
            let smImage: UIImage
            let variantsColors : [String] = []
            
    }

        print(self.objetos)
        print(self.objetos.count)
            

            
           // print(jsonProduct3)
            
            
        }
        
        //print(datas)
    }
    
    
    


}

