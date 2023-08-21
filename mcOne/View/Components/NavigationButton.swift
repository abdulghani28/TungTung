//
//  NavigationButton.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 12/08/23.
//

import SwiftUI

struct NavigationButton: View {
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: HomeView()) {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .shadow(color: Color("shadow").opacity(0.6), radius: 2, x: -2, y: 4)
            }
            .layoutPriority(1)
            ForEach(0..<9) { _ in
                Spacer()
            }
        }
    }
}
