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
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .frame(maxWidth: .infinity, alignment:.center)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                Text("Sorry, this product does not exist in the database")
                    //.padding(.top, 40)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
                    //.fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
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
