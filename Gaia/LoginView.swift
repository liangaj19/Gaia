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
            NavigationStack {
                VStack {
                    Text("Login")
                    
                    //enter username
                    TextField("Username", text: $username)
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
                    
                    Spacer()
                        .frame(height: 50)
                    
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
                            SearchView()
                        } label: {
                            Text("Continue as guest")
                        }
                    }
                    .offset(y:200)
                }
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
