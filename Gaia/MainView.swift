//
//  MainView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/25/22.
//

import SwiftUI
// 04963406
//Creates the bottom tab buttons for our app
struct MainView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            
            // search view
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Image(systemName:"magnifyingglass.circle")
                Text("Search")
            }
            .tag(1)
            
           /* // barcode view
            NavigationStack {
                BarcodeView()
            }
            .tabItem {
                Image(systemName:"barcode.viewfinder")
                Text("Scan")
            }
            .tag(2)*/
            
            // profile view
            NavigationStack {
                ProfileView()
            }
            
            .tabItem {
                Image(systemName:"person.crop.circle")
                Text("Profile")
            }
            .tag(3)
        }
        .accentColor(Color("pearlyPurple"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
