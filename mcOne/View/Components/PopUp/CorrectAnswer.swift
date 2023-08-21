//
//  correctAnswer.swift
//  mcOne
//
//  Created by Luthfi Asmara on 31/03/23.
//

import SwiftUI
struct CorrectAnswer: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black)
                .opacity(isAnimating ? 0.2 : 0)

            Circle().fill(Color.greenForGradient).frame(width: 320)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)

            Circle().fill(Color.white).opacity(0.2).frame(width: 320)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)

            Circle().fill(Color.greenForGradient).frame(width: 260)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)
            Image("happy")
                .resizable()
                .scaledToFit()
                .frame(width: 230)
                .offset(x: 0, y: -20)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)
            Text(
                """
Horeee
jawaban kamu benar!
"""
            )
                .offset(x: 0, y: 60)
                .font(.custom("Tung2-Regular", size: 22))
                .whiteTextB15()
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.2)
                .multilineTextAlignment(.center)
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

struct CorrectAnswer_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnswer()
    }
}
