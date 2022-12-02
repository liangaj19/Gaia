//
//  SearchedItemIngredientView.swift
//  Gaia
//
//  Created by student on 12/2/22.
//

import SwiftUI

struct SearchedItemIngredientView: View {
    @Binding var productName: String
    @Binding var ingredientsList: String
    var body: some View {
        Text(productName)
            .font(.system(size: 40))
            .frame(maxWidth: .infinity)
        Text(ingredientsList)
            .padding()
            .font(.system(size: 30))
        Spacer()
    }}
