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
    //@State private var customAllergyList: [String] = []
    
    @StateObject var avm = CoreDataAllergenViewModel()
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack() {
                // Color("pearlyPurple")
                Text("Select your allergens")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 40)
                    .padding(.trailing, 100)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    //.ignoresSafeArea()
                
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
                    //.padding()

                Text("Enter custom allergens here")
                    .font(.system(size: 20))
                    .padding(5)
                
                Text("Example: Bananas, Apples")
                    .font(.system(size: 15))
                    //.padding(5)
                
                TextField("Other", text: $customAllergyInput)
                    .autocapitalization(.none)
                    .padding(.all)
                    .frame(width: 350, height: 50, alignment: .center)
                    .background(Color(UIColor.lightGray))
                    .cornerRadius(10)
                
                
                Button {
                    addAllergiesToAllergyList()
                    UserDefaults.standard.firstTimeUser = false
                } label: {
                    Text("Finish")
                }
                .padding(.all)
                .background(Color.black)
                .cornerRadius(10)
                Spacer()
                
            }
            .adaptsToKeyboard()
            
        }
        .ignoresSafeArea()
    }
    
    func addAllergiesToAllergyList() {
        for allergy in allergyChecklist {
            if allergy.isChecked {
                avm.addAllergen(allergenName: allergy.name)
            }
            
        }
        
        if customAllergyInput != "" {
            let customAllergyArray: [String] = customAllergyInput.components(separatedBy: ", ")
            
            for allergy in customAllergyArray {
                avm.addAllergen(allergenName: allergy)
            }
        }
    }
}

struct AllergenPickView_Previews: PreviewProvider {
    static var previews: some View {
        AllergenPickView()
    }
}
