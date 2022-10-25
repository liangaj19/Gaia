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
    var name : String
    
}
