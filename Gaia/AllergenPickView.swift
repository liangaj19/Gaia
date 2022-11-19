//
//  AllergenPickView.swift
//  Gaia
//
//  Created by Amy Liang on 11/19/22.
//

import SwiftUI

struct AllergenPickView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Please select or enter your allergens:")
            }
        }
        /*
         * actually should change this to onAction
         * when they press the button to go into the app
         * to make sure they actually picked
         */
        .onAppear(perform: {
            UserDefaults.standard.welcomeScreenShown = true
        })
    }
}

struct AllergenPickView_Previews: PreviewProvider {
    static var previews: some View {
        AllergenPickView()
    }
}
