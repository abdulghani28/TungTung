//
//  scoreBoard.swift
//  mcOne
//
//  Created by Luthfi Asmara on 06/04/23.
//

import SwiftUI
struct ScoreBoardview: View {
    @State var score: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg").blur(radius: 2)
                VStack {
                    Text("SKOR KAMU")
                        .foregroundColor(Color("font"))
                        .padding(.top, 20)
                    Image("Star")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .overlay(
                            Text("\(score*20)")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("font"))
                        )
                    NavigationLink {
                        HomeView()
                    } label: {
                        Image("play-again")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                    }
                }.font(.custom("Tung2-Regular", size: 24))
                    .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)
            }
        }
    }
}

struct ScoreBoardview_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardview(score: 3)
    }
}
