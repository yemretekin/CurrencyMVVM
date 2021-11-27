//
//  WebService.swift
//  CryptoSwiftMVVM
//
//  Created by Emre Tekin on 24.11.2021.
//

import Foundation

class WebService{
    
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                completion(cryptoList)
                
                
            }
        }.resume()
        
    }
}
