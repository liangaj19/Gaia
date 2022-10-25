//
//  ContentView.swift
//  Gaia
//
//  Created by Amy Liang on 10/19/22.
//

import SwiftUI

//This file creates a view with a z stack that has a button which transfers the user to the food allwegy view
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.orange
                NavigationLink(destination: FoodAllergyView(allergyListViewModel: AllergyListViewModel())) {
                    Text("Go To Add")
                        .foregroundColor(Color.white)
                    
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .navigationTitle("Green")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
