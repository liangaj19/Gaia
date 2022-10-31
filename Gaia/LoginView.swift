//
//  LoginView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI


struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Login")
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .padding(.all)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.gray)
                    .cornerRadius(10)
                TextField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding(.all)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.gray)
                    .cornerRadius(10)
                Text("Not a user yet?")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
