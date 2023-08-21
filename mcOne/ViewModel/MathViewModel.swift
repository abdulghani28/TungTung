//
//  MathViewModel.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 12/08/23.
//

import SwiftUI

enum MathOperation {
    case addition
    case subtraction
}

class MathViewModel: ObservableObject {
    @Published var firstNumber = 0
    @Published var secondNumber = 0
    @Published var correctAnswer = 0
    @Published var livesCounts = 3
    @Published var isCorrect = false
    @Published var isWrong = false
    @Published var option: Set<Int> = []
    @Published var questionCount = 0
    @Published var correctResult = 0
    @Published var isPopup = false
    @Published var isScoreBoard = false
    private let operation: MathOperation
    init(operation: MathOperation) {
        self.operation = operation
        newQuestion()
    }
    func generateNumber() {
        switch operation {
        case .addition:
            firstNumber = Int.random(in: 1...5)
            secondNumber = Int.random(in: 1...4)
        case .subtraction:
            firstNumber = Int.random(in: 1...9)
            secondNumber = Int.random(in: 1...8)
            while firstNumber <= secondNumber {
                generateNumber()
            }
        }
    }
    func performOperation() {
        switch operation {
        case .addition:
            correctAnswer = firstNumber + secondNumber
        case .subtraction:
            correctAnswer = firstNumber - secondNumber
        }
    }
    func insertNumber() {
        while option.count < 3 {
            let randomNumber = Int.random(in: 1...4)
            if !option.contains(randomNumber) {
                option.insert(randomNumber)
            }
        }
    }
    func newQuestion() {
        generateNumber()
        performOperation()
        var newOption = Set<Int>()
        newOption.insert(correctAnswer)
        while newOption.count < 3 {
            let randomNumber = Int.random(in: 1...9)
            if !option.contains(randomNumber) {
                newOption.insert(randomNumber)
            }
        }
        option = newOption
    }
}
