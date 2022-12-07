//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    @State var userDefaults = UserDefaults.standard
    @State private var selectedFilter: ProfileTabModel = .allergens
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                
                headerView
                
                Spacer()
                    .frame(height: 90)
                
                profileTabs
                
                if selectedFilter == .allergens {
                    // ScrollView {
                    List {
                        let userAllergiesArray = userDefaults.object(forKey:"userAllergies") as? [String] ?? [String]()
                        let userCustomAllergiesArray = userDefaults.object(forKey:"userCustomAllergies") as? [String] ?? [String]()
                        VStack {
                            Text("Allergies")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25))
                            //Spacer()
                            //.frame(height: 10)
                            Divider()
                            if userAllergiesArray.isEmpty {
                                Text("You have no allergies recorded")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(3)
                                    .font(.system(size: 20))
                            }
                            else {
                                ForEach(userAllergiesArray, id: \.self) {string in
                                    Text(string)
                                        .padding(3)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 20))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Text("Custom Allergies")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25))
                            
                            //Spacer()
                            //.frame(height: 10)
                            Divider()
                            
                            if !userCustomAllergiesArray.isEmpty {
                                ForEach(userCustomAllergiesArray, id: \.self) {string in
                                    Text(string)
                                        .padding(3)
                                        .font(.system(size: 20))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            else {
                                Text("You have no custom allergies")
                                    .font(.system(size: 20))
                                    .padding(3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    } .listStyle(PlainListStyle())
                    //}
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(0...9, id: \.self) { _ in
                                SavedListView()
                                    .padding()
                            }
                        }
                    }
                }
                // code here what we want on each screen
                
                
                Spacer()
            }
            
        }
    } // var body
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

                    NavigationLink(destination: EditProfileView()) {
                        Button(action: { }) {
                            Text("Edit Profile")
                        }
                    }
                    /*NavigationLink(destination: EditProfileView()) {
                        Text("Edit Profile")
                    }
                    .buttonStyle(DefaultButtonStyle())*/
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
