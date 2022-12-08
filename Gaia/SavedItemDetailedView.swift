//
//  SavedItemDetailedView.swift
//  Gaia
//
//  Created by student on 12/8/22.
//

import SwiftUI

struct SavedItemDetailedView: View {
    
    var productName: String
    var ingredients: String
    
    var body: some View {
        VStack {
            Text(productName)
            Text(ingredients)
        }
    }
}
