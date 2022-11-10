//
//  Allergy.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import Foundation
import FirebaseFirestoreSwift

struct FoodItem : Codable, Identifiable {
    @DocumentID var id : String?
    var imageName: String
    var name : String
    
}

struct FoodItemList {
    
    static let foodList = [
        FoodItem(id: "1", imageName: "crunch_bar", name: "Crunch Bar"),
        FoodItem(id: "2", imageName: "cola", name: "Coca Cola"),
        FoodItem(id: "3", imageName: "apple", name: "Apple")
    ]
}
