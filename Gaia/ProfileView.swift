//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    
                    // banner and pfp
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.green)
                            .frame(maxWidth: .infinity, maxHeight: 280)
                            .ignoresSafeArea(.all)
                        
                        Image("samplePFP")
                            .resizable()
                            .frame(width:180, height: 180, alignment: .center)
                            .clipShape(Circle())
                            .padding()
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 3)
                                    .frame(width: 180, height: 180, alignment: .center)
                            )
                            .offset(y:100)
                    }
                    
                    // information
                    VStack {
                        
                        // edit profile button
                        HStack {
                            Spacer()
                                .frame(width: 220)
                            
                            NavigationLink(destination: CreateView(), label: {
                                Text("Edit Profile")
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.white, lineWidth: 2.8)
                                    )
                                    .cornerRadius(40)
                            })
                            .offset(y:-195)
                        }
                        
                        // rest of the information in profile
                        Text("Ian Vargas")
                        
                        
                        
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
