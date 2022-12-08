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
    //@State var userDefaults = UserDefaults.standard
    @State var upcNumber = ""
    @State var searchResultList: [String] = []
    @State var productAllergenWarningArray: [String] = []
    @State private var upcEntered = false
    
    @StateObject var avm = CoreDataAllergenViewModel()
    @State var userAllergyStringArray:[String] = []
    var searchResults: [String] {
        return searchResultList
    }
    var body: some View {
        //NavigationStack {
            VStack {
                Divider()
                    TextField("Enter UPC", text: $upcNumber)
                        .modifier(TextFieldClearButton(upcNumber: $upcNumber))
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            networkManager.fetchData(upcNumber: upcNumber)
                            upcEntered.toggle()
                        }
                        .frame(width: 350, alignment: .top)
                        .padding()
                        
                    
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
            .navigationTitle("Search")
            
        
    }
    
    
    func checkIngredients(ingredientsList: String, ingredientsAllergensList: String) {
        //avm.addAllergen(allergenName: "Caffeine")
        for allergy in avm.savedAllergens {
            
            userAllergyStringArray.append(allergy.allergenName ?? "")
        }

        // check default allergies
        for allergy in userAllergyStringArray {
            if (ingredientsList.lowercased().contains(allergy.lowercased()) || ingredientsAllergensList.lowercased().contains(allergy.lowercased())) && !productAllergenWarningArray.contains(allergy)  {
                productAllergenWarningArray.append(allergy)
            }
        }
        // check custom allergies
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
