//
//  NetworkManager.swift
//  Gaia
//
//  Created by student on 12/2/22.
//

import Foundation
class NetworkManager: ObservableObject {
    @Published var foodProduct = Product(code: "", ingredients_text: "", product_name: "", allergens_from_ingredients: "")
    
    // 04963406
    
    func fetchData(upcNumber: String) {
        if let url = URL(string: "https://world.openfoodfacts.org/api/v2/product/\(upcNumber)") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    print(err.localizedDescription)
                }
                else {
                    let decoder = JSONDecoder()
                    if let saveData = data {
                        do {
                            let results = try decoder.decode(Food.self, from: saveData)
                            DispatchQueue.main.async {
                                self.foodProduct = results.product
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
