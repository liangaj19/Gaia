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
            Text(ingredients)
                .padding()
                .font(.system(size: 25))
                .foregroundColor(Color.black)
            Spacer()
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
    }
}
