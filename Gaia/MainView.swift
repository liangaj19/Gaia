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
            ContentView()
                .tabItem {
                    Image(systemName:"house")
                    Text("Home")
                }
            FoodAllergyView(allergyListViewModel: AllergyListViewModel())
                .tabItem {
                    Image(systemName:"trash.circle.fill")
                    Text("Trash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
