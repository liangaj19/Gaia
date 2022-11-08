//
//  ContentView.swift
//  Gaia
//
//  Created by Amy Liang on 11/2/22.
//

import SwiftUI

extension UserDefaults {
    
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
}

struct ContentView: View {
    var body: some View {
        if UserDefaults.standard.welcomeScreenShown {
            LoginView()
        } else {
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
