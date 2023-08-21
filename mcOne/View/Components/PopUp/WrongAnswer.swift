//
//  wrongAnswer.swift
//  mcOne
//
//  Created by Luthfi Asmara on 31/03/23.
//

import SwiftUI

struct WrongAnswer: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black)
                .opacity(isAnimating ? 0.2 : 0)

            Circle().fill(Color.redForGradient).frame(width: 320)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)

            Circle().fill(Color.white).opacity(0.2).frame(width: 320)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)

            Circle().fill(Color.redForGradient).frame(width: 260)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)

            Image("sad")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .offset(x: 0, y: -10)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)
                .overlay(
                    Text("Yah, jawaban kamu belum tepat")
                        .offset(x: 0, y: 80)
                        .font(.custom("Tung2-Regular", size: 22))
                        .whiteTextB15()
                        .opacity(isAnimating ? 1 : 0)
                        .scaleEffect(isAnimating ? 1 : 0.2)
                        .multilineTextAlignment(.center)
                )

        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.isAnimating.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.isAnimating.toggle()
                }
            }
        }
    }
}

struct WrongAnswer_Previews: PreviewProvider {
    static var previews: some View {
        WrongAnswer()
    }
}
