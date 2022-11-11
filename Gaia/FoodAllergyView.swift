//
//  FoodAllergyView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//


// USE THIS LINK to connect to the FOOD ALLERGY VIEW for future tabs
//NavigationLink(destination: FoodAllergyView(allergyListViewModel: AllergyListViewModel())) {
//                    Text("Go To Add")
//                        .foregroundColor(Color.white)
                    
//                        .bold()
 //               }
//.buttonStyle(.borderedProminent)
//.navigationTitle("Green")
//.navigationBarTitleDisplayMode(.inline)


import SwiftUI

//This file is a view that shows a button called "Add" and will add a blank "name" value into the firebase database when you push it
struct FoodAllergyView: View {
    @ObservedObject var allergyListViewModel: AllergyListViewModel
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Text("Insert Your Allergy:")
                Button("Add", action: addAllergy)
            }
        }
    }
    
    
    struct FoodAllergyView_Previews: PreviewProvider {
        static var previews: some View {
            FoodAllergyView(allergyListViewModel: AllergyListViewModel())
        }
    }
    
    private func addAllergy() {
        // 1
        let allergy = Food(id: "question", imageName: "iName", name: "name")
        // 2
        allergyListViewModel.add(allergy)
        // 3
    }
}


