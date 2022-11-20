//
//  SearchView.swift
//  Gaia
//
//  Created by Amy Liang on 10/19/22.
//

import SwiftUI

//This file creates a view with a z stack that has a button which transfers the user to the food allwegy view
struct SearchView: View {
    
    private var foodLister = FoodDetail.foodList
    @State var searchText = ""

    var foods: [Food] = FoodDetail.foodList
    var body: some View {
        
        NavigationView{
            List(foods, id: \.id){ food in
                NavigationLink(destination: IngredientView(food: food)) {
                    
                    
                    HStack(spacing: 30){
                        Image(food.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .cornerRadius(4)
                            .padding(10)
                            .multilineTextAlignment(.leading)
                        Text(food.name)
                            .fontWeight(.semibold)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)                   //Prevents a long line of characters and limits the output of text lines to the chosen amount
                            .minimumScaleFactor(0.5)        //Allows the text to shrink up to the allowed ammount if there are too many words to fit with current font
                    }
                    
                    
                    
                }
            }
            .navigationTitle("Search")
        }
    }
        
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
