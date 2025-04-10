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
    
    var firstTimeUser: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "firstTimeuser") as? Bool) ?? true
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "firstTimeUser")
        }
    }
}

struct ContentView: View {
    var body: some View {
        WelcomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
