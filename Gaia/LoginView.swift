//
//  LoginView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI


struct LoginView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Login")
                TextField(
                    "Username",
                    text: $username
                )
                .padding(.all)
                .frame(width: 150, height: 20, alignment: .center)
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
