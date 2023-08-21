//
//  SubtractionStepView.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 16/08/23.
//

import SwiftUI

struct SubtractionStepView: View {
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

struct QuestionView: View {
    var count: Int
    var rows: Int
    var columns: Int
    var soundType: String
    var stepAction: () -> Void
    var body: some View {
        VStack {
            ZStack {
                Color("cream")
                DonutView(count: count, rows: rows, columns: columns)
            }
            .frame(width: 150, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
        }
        .onAppear {
            SoundService.instance.playNumberAwalSound(soundType)
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                stepAction()
            }
        }
    }
}

struct OperationButton: View {
    var text: String
    var soundType: String
    var stepAction: () -> Void
    var body: some View {
        Button(action: {
            SoundService.instance.playOperatorSound(soundType)
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                stepAction()}}) {
                    ZStack {
                Color("cream")
                Text(text)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("font"))
            }
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
        }
    }
}

struct AnswerView: View {
    var count: Int
    var rows: Int
    var columns: Int
    var soundType: String
    var stepAction: () -> Void
    var body: some View {
        VStack {
            ZStack {
                Color("bajuyona")
                DonutView(count: count, rows: rows, columns: columns)
            }
            .frame(width: 310, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
        }
        .onAppear {
            SoundService.instance.playNumberAkhirSound(soundType)
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                stepAction()
            }
        }
    }
}

// struct SubtractionStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubtractionStepView(
//            isVisible: true,
//            type: "first number",
//            count: 3,
//            rows: 2,
//            columns: 2,
//            soundType: "1",
//            stepAction: {}
//        )
//        .frame(width: 150, height: 100)
//    }
// }
