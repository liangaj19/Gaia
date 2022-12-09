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
        VStack(){
            Text(productName)
                .font(.system(size: 45))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
            Text(ingredientsList)
                .padding()
                .font(.system(size: 20))
                .foregroundColor(Color.black)
            Spacer()
        }
}}
