//
//  LoginView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isUserLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Image("icon")
                        .resizable()
                        .frame(width: 180, height: 180, alignment: .center)
                    
                    Text("Login")
                        .bold()
                        .font(.system(size: 30))
                    
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
                    
                    //login button
                    Button {
                        login()
                    } label: {
                        Text("Log In")
                            .frame(width: 275, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                            .background(Color.black)
                            .cornerRadius(40)
                    }
                    
                    Group {
                        Text("Not a user yet?")
                        
                        //create an account button
                        NavigationLink {
                            CreateView()
                        } label: {
                            Text("Create an account")
                                .frame(width: 275, height: 30, alignment: .center)
                                .foregroundColor(Color.white)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.blue, lineWidth: 3)
                                )
                                .background(Color.black)
                                .cornerRadius(40)
                        }
                        
                        //use as guest button
                        NavigationLink {
                            MainView()
                        } label: {
                            Text("Continue as guest")
                        }
                    }
                    .offset(y:0)
                }
            }
        }
    }
    /* idk how this works yet so
     * imma just put it here for now
     */
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
     
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
