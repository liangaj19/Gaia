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
         * if the welcome screen showed for 4 seconds,
         * it'll go to the login view
         */
        if isActive {
            LoginView()
        } else {
            VStack {
                
                VStack (spacing: 0) {
                    Image("justIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280, alignment: .center)
                        .offset(y:30)
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .offset(y: -100)
                }
                .offset(y:15)
                 
                
                /*
                 * another option for welcome
                VStack {
                    
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280, alignment: .center)
                        .offset(y:0)
                    
                    Text("Eat safe with just a scan.")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .offset(y: -40)
                    
                }
                .offset(y: -20)
                 */
                
                // Editing the whole screen and making it disappear after this first time
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .onAppear(perform: {
                    UserDefaults.standard.welcomeScreenShown = true
                })
            }
            // so the welcome screen only shows for 3 seconds
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
                    self.isActive = true
                }
                UserDefaults.standard.welcomeScreenShown = false
            }
             
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
