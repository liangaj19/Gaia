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
                ScrollView {
                    
                    // banner and pfp
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("matcha"))
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .ignoresSafeArea(.all)
                        
                        HStack {
                            Image("samplePFP")
                                .resizable()
                                .frame(width:140, height: 140, alignment: .center)
                                .clipShape(Circle())
                                .padding()
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 3)
                                        .frame(width: 140, height: 140, alignment: .center)
                                )
                                .shadow(radius: 10)
                                .offset(y:90)
                            
                            Text(username)
                                .font(.system(size: 22, weight: .bold))
                                .frame(minWidth: 170, alignment: .leading)
                                .offset(y: 120)
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
                                    Text("Matchmaker: Call")
                                }
                                
                                Button(action: {
                                    //
                                }) {
                                    Text("Matchmaker: Message")
                                }
                                
                                Button(action: {
                                    //
                                }) {
                                    Text("Create a groupchat")
                                }
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .background(Color.white)
                                    .foregroundColor(Color(red: 0.40784313725490196, green: 0.6235294117647059, blue: 0.2196078431372549))
                            }
                            
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
