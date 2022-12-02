//
//  SearchView.swift
//  Gaia
//
//  Created by Amy Liang on 10/19/22.
//

import SwiftUI
// 04963406

struct SearchView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var userDefaults = UserDefaults.standard
    @State var upcNumber = ""
    @State var searchResultList: [String] = []
    @State var productAllergenWarningArray: [String] = []
    @State private var upcEntered = false
    var searchResults: [String] {
        return searchResultList
    }
    var body: some View {
        NavigationStack {
            VStack {
                
                    TextField("Enter UPC", text: $upcNumber)
                        .modifier(TextFieldClearButton(upcNumber: $upcNumber))
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            networkManager.fetchData(upcNumber: upcNumber)
                            upcEntered.toggle()
                        }
                        .frame(width: 350, alignment: .top)
                        .padding(.bottom)
                        
                    
                Divider()
                    .frame(alignment: .top)
                if upcEntered && upcNumber != "" && networkManager.foodProduct.product_name != "" {
                    List() {
                        NavigationLink(destination: SearchedItemView(productAllergenWarningArray: $productAllergenWarningArray, ingredientsList: $networkManager.foodProduct.ingredients_text, productName: $networkManager.foodProduct.product_name, upcNumber: $networkManager.foodProduct.code)) {
                            Text(networkManager.foodProduct.product_name)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                Spacer()
            }
            .onReceive(networkManager.$foodProduct) { foodProduct in
                checkIngredients(ingredientsList: foodProduct.ingredients_text, ingredientsAllergensList: foodProduct.allergens_from_ingredients)
            }
            
        }
        .navigationTitle("Search")
    }
    
    
    func checkIngredients(ingredientsList: String, ingredientsAllergensList: String) {
        let userAllergiesArray = userDefaults.object(forKey:"userAllergies") as? [String] ?? [String]()
        let userCustomAllergiesArray = userDefaults.object(forKey:"userCustomAllergies") as? [String] ?? [String]()

        // check default allergies
        for allergy in userAllergiesArray {
            if ingredientsList.lowercased().contains(allergy.lowercased()) || ingredientsAllergensList.lowercased().contains(allergy.lowercased())  {
                productAllergenWarningArray.append(allergy)
            }
        }
        
        // check custom allergies
        for allergy in userCustomAllergiesArray {
            if ingredientsList.lowercased().contains(allergy.lowercased()) || ingredientsAllergensList.lowercased().contains(allergy.lowercased())  {
                productAllergenWarningArray.append(allergy)
            }
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var upcNumber: String
    
    func body(content: Content) -> some View {
        HStack {
            TextField("Enter UPC", text: $upcNumber)
            
            if !upcNumber.isEmpty {
                Button(
                    action: {
                        self.upcNumber = ""
                        //self.persons.removeAll()
                        
                    },
                    label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
