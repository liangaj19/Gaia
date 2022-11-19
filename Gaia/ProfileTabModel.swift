//
//  ProfileTabModel.swift
//  Gaia
//
//  Created by Amy Liang on 11/19/22.
//

import Foundation

enum ProfileTabModel: Int, CaseIterable {
    case allergens
    case favorites
    
    var title: String {
        switch self {
        case .allergens: return "Allergens"
        case .favorites: return "Favorites"
        }
    }
}
