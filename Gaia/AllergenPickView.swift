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
    @State var otherActive: String = ""
    
    var body: some View {
        ZStack {
            
            Image("genericWallpaper")
                .resizable()
                .frame(height: 1000)
            
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                
                Text("Please select or enter your allergens:")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(width: 400)
                
                VStack(spacing: 30) {
                    HStack (spacing: 30){
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
                    HStack (spacing: 30){
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
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 330, height: 60, alignment: .center)
                            .foregroundColor(Color.purple)
                            .cornerRadius(10)
                        TextField("Other", text: $otherActive)
                            .autocapitalization(.none)
                            .font(.title)
                            .padding(.all)
                            .frame(width: 320, height: 50, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                   
                }
                Spacer()
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
