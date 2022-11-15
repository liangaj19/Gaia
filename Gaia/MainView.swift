//
//  MainView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/25/22.
//

import SwiftUI

//Creates the bottom tab buttons for our app
struct MainView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            SearchView()
                .tabItem {
                    Image(systemName:"magnifyingglass.circle")
                    Text("Search")
                }
                .tag(1)
            BarcodeView(allergyListViewModel: AllergyListViewModel())
                .tabItem {
                    Image(systemName:"barcode.viewfinder")
                    Text("Scan")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName:"person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
