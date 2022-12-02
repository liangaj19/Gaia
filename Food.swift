//
//  Allergy.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import Foundation
import FirebaseFirestoreSwift

// OLD STUFF, NEED TO DELETE
struct OldFood : Codable, Identifiable {
    @DocumentID var id : String?
    var imageName: String
    var name : String
    
}

struct FoodDetail {
    static let foodList = [
        OldFood(id: "1", imageName: "crunch_bar", name: "Crunch Bar"),
        OldFood(id: "2", imageName: "cola", name: "Coca Cola"),
        OldFood(id: "3", imageName: "apple", name: "Apple")
    ]
}

struct Food: Codable {
    let product: Product
    
}

struct Product: Codable {
    var code: String
    var ingredients_text: String
    var product_name: String
    var allergens_from_ingredients: String
    
}

// NEW STUFF: DON'T DELETE
