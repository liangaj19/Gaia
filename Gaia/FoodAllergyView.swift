//
//  FoodAllergyView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import SwiftUI

struct FoodAllergyView: View {
    @ObservedObject var allergyListViewModel: AllergyListViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Add", action: addAllergy)
    }
    
    
    struct FoodAllergyView_Previews: PreviewProvider {
        static var previews: some View {
            FoodAllergyView(allergyListViewModel: AllergyListViewModel())
        }
    }
    
    private func addAllergy() {
        // 1
        let allergy = Allergy(id: "question", name: "name")
        // 2
        allergyListViewModel.add(allergy)
        // 3
    }
}
