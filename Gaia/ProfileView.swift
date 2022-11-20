//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileTabModel = .allergens
    
    var body: some View {
        VStack (alignment: .leading) {
            
            headerView
            
            Spacer()
                .frame(height: 90)
            
            profileTabs
            
            
            // code here what we want on each screen
            
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    
    // header
    var headerView: some View {
        ZStack (alignment: .bottomLeading) {
            //banner
            Color("pearlyPurple")
                .ignoresSafeArea()
            
            //options
            VStack {
                Menu {
                    Button(action: {
                        
                    }) {
                        Text("Log In")
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Create an Account")
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Edit Profile")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                    // how to make this .trailing? it wont work
                        .frame(width: 35, height: 30, alignment: .topTrailing)
                        .foregroundColor(Color.white)
                }
                .offset(x: 320, y: -50)
            }
            
            HStack {
                //profile picture
                Image("samplePFP")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle()
                            .stroke(Color("pearlyPurple"))
                    )
                    .shadow(radius: 5)
                    .offset(x: 20, y: 50)
                
                Spacer()
                    .frame(width: 40)
                
                //user's name
                /* figure out how to connect to firebase
                 * so that we know how to make the
                 * username what the user wants
                 */
                Text("Guest")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(y: 75)
            }
        }
        .frame(height: 100)
    }
    
    var profileTabs : some View {
        HStack {
            
            ForEach(ProfileTabModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold: .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color("pearlyPurple"))
                            .frame(height: 3)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(y: 16))
    }
    
}
