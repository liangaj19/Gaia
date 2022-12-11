//
//  ProfileView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct ProfileView: View {
    //@State var userDefaults = UserDefaults.standard
    @State private var selectedFilter: ProfileTabModel = .allergens
    
    @StateObject var avm = CoreDataAllergenViewModel()
    @StateObject var sivm = CoreDataSavedItemViewModel()
    
    var body: some View {
        //NavigationStack {
            VStack (alignment: .leading) {
                
                headerView
                
                Spacer()
                    .frame(height: 90)
                
                profileTabs
                
                if selectedFilter == .allergens {
                    // ScrollView {
                    VStack {
                        //Text("Allergies (swipe to delete)")
                            //.frame(maxWidth: .infinity, alignment: .leading)
                            //.font(.system(size: 25))
                            //.padding()
                        
                        //Spacer()
                        //.frame(height: 10)
                        //Divider()
                        if avm.savedAllergens.isEmpty {
                            Text("You have no allergies recorded")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .font(.system(size: 23))
                        }
                        else {
                            List {
                                ForEach(avm.savedAllergens) { item in
                                    Text(item.allergenName ?? "")
                                        .font(.system(size: 23))
                                }
                                .onDelete(perform: avm.deleteAllegen)
                                
                                
                                //.padding()
                                //.toolbar {
                                //EditButton()
                            }
                            .listStyle(PlainListStyle())
                            
                            //.padding()
                        }
                        
                        //NavigationLink(destination: EditProfileView()) {
                        //Text("edit")
                        //}
                        Spacer()
                            .frame(height: 20)
                        
                        
                        //Spacer()
                        //.frame(height: 10)
                        //Divider()
                    }
                    //.padding()
                    //}
                } else {
                    if sivm.savedItems.isEmpty {
                        Text("You have no saved items")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .font(.system(size: 23))
                    }
                    else {
                        List {
                            ForEach(sivm.savedItems){ item in
                                
                                    NavigationLink(destination: SavedItemDetailedView(productName: item.productName ?? "", ingredients: item.ingredientList ?? "")) {
                                        
                                            Text(item.productName ?? "No name")
                                    }
                                
                                
                            }
                            .onDelete(perform: sivm.deleteItem)
                            
                            
                            //
                            //.toolbar {
                            //EditButton()
                        }
                        .listStyle(PlainListStyle())
                        .padding()
                        
                    }
                }
                // code here what we want on each screen
                
                
                Spacer()
            }
            .onAppear {
                //avm = CoreDataAllergenViewModel()
                avm.fetchAllergen()
                sivm.fetchSavedItems()
            } //vstack
            
        //}
    } // var body
    /*
    func removeRows(at offsets: IndexSet) {
        avm.savedAllergens.remove(atOffsets: offsets)
        avm.fetchAllergen()
        sivm.fetchSavedItems()
    }*/
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
            
            //VStack {
                
                //Menu {
                    /*Button(action: {
                        
                    }) {
                        Text("Log In")
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Create an Account")
                    }*/
                    
                    //NavigationLink(destination: EditProfileView()) {
                        //Text("edit")
                    //}
                    //.buttonStyle(DefaultButtonStyle())
                
                //} label: {
                    /*Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                    // how to make this .trailing? it wont work
                        .frame(width: 35, height: 30, alignment: .topTrailing)
                        .foregroundColor(Color.white)
                }
                .offset(x: 320, y: -50)*/
            //}
            
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
                Text("Your Profile")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(y: 75)
            }
            
            
            HStack {
                Spacer()
                VStack {
                    NavigationLink(destination: EditProfileView()) {
                        Text("Add allergens")
                    }
                    .buttonStyle(DefaultButtonStyle())
                    .foregroundColor(.white)
                    .padding(10)
                    
                    //.overlay(
                        //RoundedRectangle(cornerRadius: 30)
                            //.stroke(Color.black, lineWidth: 2)
                    //)
                    //.foregroundColor(Color.black)
                    Spacer()
                        .frame(height: 20)
                }
                Spacer()
                    .frame(width: 15)
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
