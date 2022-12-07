//
//  SearchedItemView.swift
//  Gaia
//
//  Created by student on 12/2/22.
//

import SwiftUI

struct SearchedItemView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var userDefaults = UserDefaults.standard
    @State private var showingAlert = false
    @Binding var productAllergenWarningArray: [String]
    @Binding var ingredientsList: String
    @Binding var productName: String
    @Binding var upcNumber: String
    var body: some View {
        Text(productName)
            .font(.system(size: 40))
            
            .frame(maxWidth: .infinity)
            .padding()
        if productAllergenWarningArray.isEmpty {
            Text("This product does not contain any allergens")
                
                .font(.system(size: 30))
                .padding()
            
        }
        else {
            Text("This product contains: ")
                .padding(3)
                .foregroundColor(Color.black)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(productAllergenWarningArray, id: \.self) {string in
                Text(string)
                    .padding(3)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        NavigationLink(destination: SearchedItemIngredientView(productName: $productName, ingredientsList: $ingredientsList)) {
            Text("see all ingredients")
                .padding()
        }
        .buttonStyle(DefaultButtonStyle())
        
        Button {
            addItemToSavedItemsList()
            showingAlert = true
        } label: {
            Text("Save Item")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("This item has been saved"), dismissButton: .default(Text("OK")
                                                                                                     ))
        }
        Spacer()
        //.navigationTitle(productName)

        
    }
            
    func addItemToSavedItemsList() {
        var userNewSavedItemsNameList = userDefaults.object(forKey:"userSavedItemsName") as? [String] ?? [String]()
        var userNewSavedItemsIngredientsList = userDefaults.object(forKey:"userSavedItemsIngredients") as? [String] ?? [String]()
    
        //var userNewSavedItems = userDefaults.object(forKey:"userSavedItems") as? [SavedItem] ?? [SavedItem]()
        //let newSavedItem = SavedItem(name: productName, ingredientsList: ingredientsList)
        //userNewSavedItems.append(newSavedItem)
        //userDefaults.set(userNewSavedItems, forKey: "userSavedItems")
        
        //Allergy(name: "Milk", isChecked: false)
        userNewSavedItemsNameList.append(productName)
        userNewSavedItemsIngredientsList.append(ingredientsList)
        userDefaults.set(userNewSavedItemsNameList, forKey: "userSavedItemsName")
        userDefaults.set(userNewSavedItemsIngredientsList, forKey: "userSavedItemsIngredients")
    }
}
