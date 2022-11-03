//
//  WelcomeView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @AppStorage("welcomeScreenShown") // UserDefaults
    var welcomeScreenShown: Bool = false
    
    @State private var isActive = false
    
    var body: some View {
        /*
         * if the welcome screen showed for 3 seconds,
         * it'll go to the login view
         */
        if isActive {
            LoginView()
        } else {
            VStack {
                VStack {
                    Text("Welcome")
                        .padding(.all)
                    Image("icon")
                        .resizable()
                        .frame(width:300, height: 300, alignment: .center)
                }
                // Editing the whole screen and making it disappear after this first time
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
                .onAppear(perform: {
                    UserDefaults.standard.welcomeScreenShown = true
                })
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
