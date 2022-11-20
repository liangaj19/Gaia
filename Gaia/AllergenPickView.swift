//
//  AllergenPickView.swift
//  Gaia
//
//  Created by Amy Liang on 11/19/22.
//

import SwiftUI

struct AllergenPickView: View {

    @State var peanutActive = false
    @State var dairyActive = false
    @State var soyActive = false
    @State var shellfishActive = false
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Please select or enter your allergens:")
                    .font(.title)
                
                VStack() {
                    HStack (){
                        Button {
                            self.peanutActive.toggle()
                        } label: {
                            ToggleButton(buttonText: "Peanut", buttonColor: .purple, active: peanutActive)
                        }
                        
                        Button {
                            self.dairyActive.toggle()
                        } label: {
                            ToggleButton(buttonText: "Dairy", buttonColor: .purple, active: dairyActive)
                        }
                    }
                    HStack (){
                        Button {
                            self.soyActive.toggle()
                        } label: {
                            ToggleButton(buttonText: "Soy", buttonColor: .purple, active: soyActive)
                        }
                        
                        Button {
                            self.shellfishActive.toggle()
                        } label: {
                            ToggleButton(buttonText: "Shellfish", buttonColor: .purple, active: shellfishActive)
                        }
                    }
                }
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
