//
//  SearchedItemNotExistView.swift
//  Gaia
//
//  Created by student on 12/13/22.
//

import SwiftUI

struct SearchedItemNotExistView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Item Not Found")
                    .font(.system(size: 41))
                    .frame(maxWidth: .infinity, alignment:.center)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                Spacer(minLength: 40)
                Text("Sorry, this product does not exist in the database")
                    //.padding(.top, 40)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
                    //.fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                Image("question")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.4)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct SearchedItemNotExistView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedItemNotExistView()
    }
}
