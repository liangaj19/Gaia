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
    // allergy checklist variables
    @State private var allergyChecklist = [Allergy(name: "Milk", isChecked: false),  Allergy(name: "Eggs", isChecked: false),  Allergy(name: "Tree nuts", isChecked: false), Allergy(name: "Peanuts", isChecked: false), Allergy(name: "Shellfish", isChecked: false), Allergy(name: "Wheat", isChecked: false), Allergy(name: "Soy", isChecked: false), Allergy(name: "Fish", isChecked: false), Allergy(name: "Corn", isChecked: false), Allergy(name: "Alcohol", isChecked: false)]
    
    // allergy input for text field
    @State private var customAllergyInput: String = ""
    
    // core data
    @StateObject var avm = CoreDataAllergenViewModel()
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack() {
                Text("Select your allergens")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .frame(maxWidth: .infinity, alignment:.center)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .multilineTextAlignment(.center)
                
                List() {
                    ForEach($allergyChecklist) {$allergy in
                        HStack {
                            Text(allergy.name)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            allergy.isChecked.toggle()
                        }
                        .listRowBackground(allergy.isChecked ? Color("palePurple") : Color.clear)
                        .padding(5)
                        .font(.system(size: 20))
                    }
                }
                .listStyle(PlainListStyle())
                
                Group {
                    Rectangle()
                        .frame(height: 1.5)
                        .foregroundColor(Color("pearlyPurple"))
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text("Enter custom allergens here")
                        .font(.system(size: 20))
                        .padding(5)
                    
                    Text("Example: Bananas, Apples")
                        .font(.system(size: 15))
                        .padding(5)
                    
                    TextField("Other", text: $customAllergyInput)
                        .autocapitalization(.none)
                        .padding(.all, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1.5)
                        )
                        .frame(width: 350, height: 30, alignment: .center)
                    //.background(Color("pearlyPurple"))
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button {
                        addAllergiesToAllergyList()
                        UserDefaults.standard.firstTimeUser = false
                    } label: {
                        Text("Finish")
                    }
                    .padding(.all)
                    .foregroundColor(Color.white)
                    .frame(width: 170)
                    .background(Color("pearlyPurple"))
                    .cornerRadius(40)
                    
                    Spacer()
                        .frame(height: 10)
                    Spacer()
                }
                
                
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
