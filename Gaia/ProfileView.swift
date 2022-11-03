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
