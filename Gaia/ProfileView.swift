//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var username: String = "Guest"
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    // banner and pfp
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("matcha"))
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .ignoresSafeArea(.all)
                        
                        HStack {
                            Image("samplePFP")
                                .resizable()
                                .frame(width:130, height: 130, alignment: .center)
                                .clipShape(Circle())
                                .padding()
                                .overlay(
                                    Circle()
                                        .stroke(Color("matcha"), lineWidth: 3)
                                        .frame(width: 130, height: 130, alignment: .center)
                                )
                                .shadow(radius: 10)
                                .offset(y:90)
                            
                            Text(username)
                                .font(.system(size: 22, weight: .bold))
                                .frame(minWidth: 200, alignment: .leading)
                                .offset(y: 115)
                        }
                    }
                    
                    // information
                    VStack {
                        
                        // edit profile button
                        HStack {
                            Spacer()
                                .frame(width: 220)
                            
                            Menu {
                                Button(action: {
                                    //
                                }) {
                                    Text("Edit profile")
                                }
                                
                                Button (action: {
                                    
                                }) {
                                    Text("Add an allergen")
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 80)
                            }
                            .offset(x: 30, y:-185)
                            
                        }
                        
                    }
                    .offset(y:40)
                    
                }
                .ignoresSafeArea(.all)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
