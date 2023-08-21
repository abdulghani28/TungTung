//
//  AnswerAddWidget.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 12/08/23.
//

import SwiftUI

struct AdditionAnswerWidget: View {
    @Binding var option: Set<Int>
    @Binding var isCorrect: Bool
    @Binding var isWrong: Bool
    @Binding var correctAnswer: Int
    @Binding var questionCount: Int
    @Binding var correctResult: Int
    @Binding var livesCounts: Int
    @Binding var isPopup: Bool
    var body: some View {
        HStack {
            ForEach(option.shuffled(), id: \.self) { choosedAnswer in
                Button {
                    if choosedAnswer == correctAnswer {
                        self.isCorrect = true
                        self.correctResult = correctResult+1
                        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                            self.isPopup = true
                        }
                    } else {
                        self.isWrong = true
                        self.livesCounts = livesCounts-1
                        if livesCounts==0 {
                            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                                self.isPopup = true
                            }
                        }
                    }
                } label: {
                    AnswerButton(number: choosedAnswer)
                }
            }
        }
    }
}
