//
//  API.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 21.05.2022.
//

import Foundation
class API {
    
    static func getCategoryData(completion: @escaping (BaseModel<Category>) -> Void) {
        
        let url = URL(string: "\(Constants.categoryUrl)")
        let req = URLRequest(url: url!)
        URLSession.shared.dataTask(with: req) { data , response, error  in
            
            if error != nil {
                return
            }
           let decoder = JSONDecoder()
           let model = try! decoder.decode(BaseModel<Category>.self, from: data!)
            completion(model)
        }.resume()
    }
    
    static func getDishesData(completion: @escaping (BaseModel<Dish>) -> Void) {
        
        let url = URL(string: "\(Constants.dishesUrl)")
        let req = URLRequest(url: url!)
        URLSession.shared.dataTask(with: req) { data , response, error  in
            
            if error != nil {
                return
            }
            let decoder = JSONDecoder()
            let model = try! decoder.decode(BaseModel<Dish>.self, from: data!)
             completion(model)
            
            
            
      //     let decoder = JSONDecoder()
       //    let model = try! decoder.decode(BaseModel.self, from: data!)
       //     completion(model)
        }.resume()
    }

}
