//
//  AdditionStepView.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 16/08/23.
//

import SwiftUI

struct AdditionStepView: View {
    var isVisible: Bool
    var type: String
    var count: Int
    var rows: Int
    var columns: Int
    var soundType: String
    var stepAction: () -> Void
    var body: some View {
        if isVisible {
            if type == "question" {
                QuestionView(count: count, rows: rows, columns: columns, soundType: soundType, stepAction: stepAction)
            } else if type == "operation" {
                OperationButton(text: soundType == "Ditambah" ? "+" : "-", soundType: soundType, stepAction: stepAction)
            } else if type == "answer" {
                AnswerView(count: count, rows: rows, columns: columns, soundType: soundType, stepAction: stepAction)
            } else if type == "equal" {
                OperationButton(text: "=", soundType: soundType, stepAction: stepAction)
            }
        }
    }
}
