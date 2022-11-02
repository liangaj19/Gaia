//
//  WelcomeView.swift
//  Gaia
//
//  Created by Amy Liang on 10/31/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome")
                    .padding(.all)
                Image("icon")
                    .resizable()
                    .frame(width:300, height: 300, alignment: .center)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
