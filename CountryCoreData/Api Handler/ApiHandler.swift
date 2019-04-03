//
//  ApiHandler.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation

class ApiHandler: NSObject {
    static let sharedInstance = ApiHandler()
    private override init() {}
    func getApiForCountry(completion: @escaping (_ arrayCountry: CountryData?, _ error: Error?) -> Void){
        let urlString1 = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: urlString1) else{
            return
        }
        URLSession.shared.dataTask(with : url){ (data, response, error) in
            guard let data = data else {
                return
            }
            if error == nil{
                do{
                    let country = try? JSONDecoder.init().decode(CountryData.self, from: data)
                        DispatchQueue.main.async {
                            completion(country,nil)
                    }
                }
                catch{
                    completion(nil,error)
                }
            }
            }.resume()
    }
}
