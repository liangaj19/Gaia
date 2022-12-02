//
//  AllergenPickView.swift
//  Gaia
//
//  Created by Amy Liang on 11/19/22.
//

import SwiftUI

struct Allergy: Identifiable {
    let id = UUID()
    let name: String
    var isChecked: Bool
}

struct AllergenPickView: View {

    @State private var allergyChecklist = [Allergy(name: "Milk", isChecked: false),  Allergy(name: "Eggs", isChecked: false),  Allergy(name: "Tree nuts", isChecked: false), Allergy(name: "Peanuts", isChecked: false), Allergy(name: "Shellfish", isChecked: false), Allergy(name: "Wheat", isChecked: false), Allergy(name: "Soy", isChecked: false), Allergy(name: "Fish", isChecked: false), Allergy(name: "Corn", isChecked: false), Allergy(name: "Alcohol", isChecked: false)]
    @State private var customAllergyInput: String = ""
    
    // arrays to save into userdefaults
    @State private var userAllergyList: [String] = []
    @State private var customAllergyList: [String] = []
    
    @State var userDefaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            Text("Pick your allergens")
                .font(.system(size: 30))
            
            Divider()
           
            List() {
                ForEach($allergyChecklist) {$allergy in
                    Text(allergy.name)
                        .onTapGesture {
                            allergy.isChecked.toggle()
                        }
                        
                        .listRowBackground(allergy.isChecked ? Color(UIColor.lightGray) : Color.clear)
                        .padding(5)
                        .font(.system(size: 20))
                        
                }
            }
            .listStyle(PlainListStyle())
            Divider()
            Text("Enter custom allergens here")
                .font(.system(size: 20))
            
            Text("Example: Bananas, Apples")
                .font(.system(size: 15))
            
            TextField("Other", text: $customAllergyInput)
                .autocapitalization(.none)
                .padding(.all)
                .frame(width: 350, height: 50, alignment: .center)
                .background(Color(UIColor.lightGray))
                .cornerRadius(10)
            
            Button {
                addAllergiesToAllergyList()
            } label: {
                Text("Finish")
            }
            .padding(.all)
            .background(Color.black)
            .cornerRadius(10)
        }
        
        /*
         * actually should change this to onAction
         * when they press the button to go into the app
         * to make sure they actually picked
         */
        .onAppear(perform: {
            UserDefaults.standard.welcomeScreenShown = true
        })
    }
    
    func addAllergiesToAllergyList() {
        for allergy in allergyChecklist {
            if allergy.isChecked {
                userAllergyList.append(allergy.name)
            }
        }
        
        if customAllergyInput != "" {
            let customAllergyArray: [String] = customAllergyInput.components(separatedBy: ", ")
            
            for allergy in customAllergyArray {
                customAllergyList.append(allergy)
            }
        }
        
        userDefaults.set(userAllergyList, forKey: "userAllergies")
        userDefaults.set(customAllergyList, forKey: "userCustomAllergies")
    }
}

struct AllergenPickView_Previews: PreviewProvider {
    static var previews: some View {
        AllergenPickView()
    }
}
