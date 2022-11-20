//
//  ToggleButton.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 11/19/22.
//

import SwiftUI

struct ToggleButton: View {
    var buttonText = "Allergy"
    var buttonColor = Color("Gray")
    var active = false
    
    var body: some View {
        ZStack {
            
            if active {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 55)
                .foregroundColor(buttonColor)
                Text(buttonText)
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color.white)
            } else {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 55)
                    .foregroundColor(Color.purple)
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 140, height: 45)
                    .foregroundColor(Color.white)
                Text(buttonText)
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color.black)
            }
            
            
        }
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton()
    }
}
