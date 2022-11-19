//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomLeading) {
                //banner
                Color("pearlyPurple")
                    .ignoresSafeArea()
                
                //profile picture
                Image("samplePFP")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle()
                            .stroke(Color.black)
                    )
                    .offset(x: 20, y: 50)
                    
            }
            .frame(height: 100)
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
