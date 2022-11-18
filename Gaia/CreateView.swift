//
//  CreateView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI
import Firebase

struct CreateView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isUserLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Text("Create an account")
                        .bold()
                        .font(.system(size: 30))
                    
                    VStack(spacing: 16) {
                        //enter username
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .padding(.all)
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(Color.gray)
                            .cornerRadius(10)
                        
                        //enter password
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                            .padding(.all)
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    // create button
                    Button {
                        register()
                    } label: {
                        Text("Create")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.all)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 3)
                    )
                    .background(Color.black)
                    .cornerRadius(40)
                    
                }
            }
        }
    }
    
    // sign up function to connect firebase
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
