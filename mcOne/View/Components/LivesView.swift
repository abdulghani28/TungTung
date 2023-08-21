//
//  lives.swift
//  mcOne
//
//  Created by Luthfi Asmara on 05/04/23.
//

import SwiftUI

struct LivesView: View {
    @Binding var livesCount: Int
    var body: some View {
        HStack {
                ForEach(0..<livesCount, id: \.self) { _ in
                    Image("Icecream")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)
            }
        }
    }
}
