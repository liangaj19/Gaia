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
        ScrollView {
            Text(productName)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .fontWeight(.bold)
                .padding(.top, 100)
                .padding(.bottom, 40)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .frame(maxWidth: .infinity, alignment:.center)
                .background(Color("pearlyPurple"))
                .foregroundColor(Color.white)
                .mask(RoundedRectangle(cornerRadius: 30))
            Spacer()
                .frame(height: 20)
            Text("Ingredients: ")
                .font(.system(size: 30))
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            Divider()
            Text(ingredientsList)
                .padding()
                .font(.system(size: 25))
                .foregroundColor(Color.black)
            Spacer()
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
}}
