//
//  MainView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/25/22.
//

import SwiftUI

//Creates the bottom tab buttons for our app
struct MainView: View {
    var body: some View {
        TabView{
            SearchView()
                .tabItem {
                    Image(systemName:"magnifyingglass.circle")
                    Text("Search")
                }
            FoodAllergyView(allergyListViewModel: AllergyListViewModel())
                .tabItem {
                    Image(systemName:"barcode.viewfinder")
                    Text("Scan")
                }
            ProfileView()
                .tabItem {
                    Image(systemName:"person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
