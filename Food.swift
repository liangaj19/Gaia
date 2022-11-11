//
//  Allergy.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Food : Codable, Identifiable {
    @DocumentID var id : String?
    var imageName: String
    var name : String
    
}

struct FoodDetail {
    static let foodList = [
        Food(id: "1", imageName: "crunch_bar", name: "Crunch Bar"),
        Food(id: "2", imageName: "cola", name: "Coca Cola"),
        Food(id: "3", imageName: "apple", name: "Apple")
    ]
}
