//
//  addView.swift
//  mcOne
//
//  Created by Luthfi Asmara on 16/03/23.
//

import SwiftUI

struct AdditionQuestionView: View {
    @StateObject private var additionViewModel = MathViewModel(operation: .addition)
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
                        AdditionQuestionWidget(
                            firstNumber: $additionViewModel.firstNumber,
                            secondNumber: $additionViewModel.secondNumber
                        )
                        Spacer().frame(height: 20)
                        AdditionAnswerWidget(
                            option: $additionViewModel.option,
                            isCorrect: $additionViewModel.isCorrect,
                            isWrong: $additionViewModel.isWrong,
                            correctAnswer: $additionViewModel.correctAnswer,
                            questionCount: $additionViewModel.questionCount,
                            correctResult: $additionViewModel.correctResult,
                            livesCounts: $additionViewModel.livesCounts,
                            isPopup: $additionViewModel.isPopup
                        )
                    }
                    VStack {
                        LivesView(livesCount: $additionViewModel.livesCounts)
                        TeacherView()
                    }
                    .offset(x: -60, y: 25)
                }
                if additionViewModel.isWrong {
                    WrongAnswer()
                }
                if additionViewModel.isCorrect {
                    CorrectAnswer()
                }
                if additionViewModel.isPopup {
                    AdditionExplanationView(
                        num1: additionViewModel.firstNumber,
                        num2: additionViewModel.secondNumber,
                        answer: additionViewModel.correctAnswer
                    )
                        .onTapGesture {
                            handleExplanationTap()
                        }
                }
                if additionViewModel.isScoreBoard {
                    ScoreBoardview(score: additionViewModel.correctResult)
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                additionViewModel.newQuestion()
            }
        }
        .onAppear {
            SoundService.instance.playBackgroundSound("low")
        }
    }
    private func handleExplanationTap() {
        additionViewModel.questionCount += 1
        additionViewModel.isWrong = false
        additionViewModel.isCorrect = false
        additionViewModel.isPopup = false
        if additionViewModel.livesCounts == 0 || additionViewModel.questionCount == 5 {
            additionViewModel.isScoreBoard = true
        } else {
            additionViewModel.newQuestion()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionQuestionView()
    }
}
