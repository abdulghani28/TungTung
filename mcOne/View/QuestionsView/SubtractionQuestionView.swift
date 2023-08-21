//
//  SubtractionView.swift
//  mcOne
//
//  Created by Luthfi Asmara on 16/03/23.
//

import SwiftUI

struct SubtractionQuestionView: View {
    @StateObject private var subtractionViewModel = MathViewModel(operation: .subtraction)
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 8)
                HStack {
                    VStack {
                        NavigationButton()
                        Spacer().frame(height: 20)
                        SubtractionQuestionWidget(
                            firstNumber: $subtractionViewModel.firstNumber,
                            secondNumber: $subtractionViewModel.secondNumber
                        )
                        Spacer().frame(height: 20)
                        SubtractionAnswerWidget(
                            option: $subtractionViewModel.option,
                            isCorrect: $subtractionViewModel.isCorrect,
                            isWrong: $subtractionViewModel.isWrong,
                            correctAnswer: $subtractionViewModel.correctAnswer,
                            questionCount: $subtractionViewModel.questionCount,
                            correctResult: $subtractionViewModel.correctResult,
                            livesCounts: $subtractionViewModel.livesCounts,
                            isPopup: $subtractionViewModel.isPopup
                        )
                    }
                    VStack {
                        LivesView(livesCount: $subtractionViewModel.livesCounts)
                        TeacherView()
                    }
                    .offset(x: -60, y: 25)
                }
                if subtractionViewModel.isWrong {
                    WrongAnswer()
                }
                if subtractionViewModel.isCorrect {
                    CorrectAnswer()
                }
                if subtractionViewModel.isPopup {
                    SubtractionExplanationView(
                        num1: subtractionViewModel.firstNumber,
                        num2: subtractionViewModel.secondNumber,
                        answer: subtractionViewModel.correctAnswer
                    )
                    .onTapGesture {
                            handleExplanationTap()
                        }
                }
                if subtractionViewModel.isScoreBoard {
                    ScoreBoardview(score: subtractionViewModel.correctResult)
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                subtractionViewModel.newQuestion()
            }
        }
        .onAppear {
            SoundService.instance.playBackgroundSound("low")
        }
    }
    private func handleExplanationTap() {
        subtractionViewModel.questionCount += 1
        subtractionViewModel.isWrong = false
        subtractionViewModel.isCorrect = false
        subtractionViewModel.isPopup = false
        if subtractionViewModel.livesCounts == 0 || subtractionViewModel.questionCount == 5 {
            subtractionViewModel.isScoreBoard = true
        } else {
            subtractionViewModel.newQuestion()
        }
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionQuestionView()
    }
}
