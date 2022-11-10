//
//  Allergy.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Allergy : Codable, Identifiable {
    @DocumentID var id : String?
    var imageName: String
    var name : String
    
}

struct foodIngredientList {
    
    static let foodList = [
        Allergy(id: "1", imageName: "crunch_bar", name: "Crunch Bar"),
        Allergy(id: "2", imageName: "cola", name: "Coca Cola"),
        Allergy(id: "3", imageName: "apple", name: "Apple")
    ]
}
