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
    
    @AppStorage("firstTimeUser")
    var firstTimeUser: Bool = true
    
    @State private var isActive = false
    
    var body: some View {
        /*
         * if the welcome screen showed for 3 seconds,
         * it'll go to the login view
         */
        if isActive == true && firstTimeUser == true {
            AllergenPickView()
        } else if isActive == true && firstTimeUser == false {
            MainView()
        } else {
            ZStack {
                // circles in the background
                Group {
                    // pink circles
                    Circle()
                        .foregroundColor(Color("lightPink"))
                        .frame(width: 240, height: 240)
                        .offset(x: -170, y: 390)
                    
                    // pearly purple
                    Circle()
                        .foregroundColor(Color("pearlyPurple"))
                        .frame(width: 100, height: 100)
                        .offset(x: -200, y: 120)
                    Circle()
                        .foregroundColor(Color("pearlyPurple"))
                        .frame(width: 240, height: 240)
                        .offset(x: 190, y: -480)
                    
                    // blue circles
                    Circle()
                        .foregroundColor(Color("beauBlue"))
                        .frame(width: 220, height: 220)
                        .offset(x: 220, y: 150)
                    Circle()
                        .foregroundColor(Color("beauBlue"))
                        .frame(width: 190, height: 190)
                        .offset(x: -220, y: -320)
                    
                    // green circles
                    Circle()
                        .foregroundColor(Color("matcha"))
                        .frame(width: 115, height: 120)
                        .offset(x: 100, y: 420)
                    Circle()
                        .foregroundColor(Color("matcha"))
                        .frame(width: 100, height: 100)
                        .offset(x: 200, y: -180)
                    
                    // yellow circle
                    Circle()
                        .foregroundColor(Color("lightYellow"))
                        .frame(width: 115, height: 115)
                        .offset(x: -220, y: -100)
                }
                
                VStack {
                    
                    VStack (spacing: 0) {
                        Image("smallIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 290, height: 290, alignment: .center)
                            .offset(y:30)
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200, alignment: .center)
                            .offset(y: -120)
                    }
                    .offset(y:15)
                    
                    // Editing the whole screen and making it disappear after this first time
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    // .background(Color.white)
                    .onAppear(perform: {
                        UserDefaults.standard.welcomeScreenShown = true
                    })
                }
            }
            // so the welcome screen only shows for 3 seconds
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
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
