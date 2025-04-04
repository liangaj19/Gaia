//
//  IngredientView.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 11/9/22.
//

import SwiftUI

struct IngredientView: View {
    
    var food : OldFood
    var body: some View {
        VStack(spacing: 20){
            Image(food.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 100)
                
            Text(food.name)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            HStack{
                Label("DUMMY ALLERGY", systemImage: "eye.fill") //Replace DUMMY ALLERGY with variable that will allow for a dynamic screen that fits for any food allergy
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("REPLACE THIS WITH INGEDIENT LIST")
                .font(.body)
                .padding()
            
            
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(food: FoodDetail.foodList.first!)
    }
}
