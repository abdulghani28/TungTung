//
//  QuestionSubtractionWidget.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 12/08/23.
//

import SwiftUI

struct SubtractionQuestionWidget: View {
    @Binding var firstNumber: Int
    @Binding var secondNumber: Int
    var body: some View {
        let firstColumns = Int(ceil(sqrt(Double(firstNumber))))
        let firstRows = Int(ceil(Double(firstNumber) / Double(firstColumns)))
        let secondColumns = Int(ceil(sqrt(Double(secondNumber))))
        let secondRows = Int(ceil(Double(secondNumber) / Double(secondColumns))) //
        HStack {
            ZStack {
                Color("cream")
                HStack {
                    ZStack {
                        DonutView(count: firstNumber, rows: firstRows, columns: firstColumns)
                    }
                    .frame(width: 150)
                    ZStack {
                        Text("-")
                            .font(.custom("Tung2-Regular", size: 40))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("font"))
                    }
                    .frame(width: 50)
                    ZStack {
                        DonutView(count: secondNumber, rows: secondRows, columns: secondColumns)
                    }
                    .frame(width: 150)
                    ZStack {
                        Text("=")
                            .font(.custom("Tung2-Regular", size: 40))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("font"))
                    }
                    .frame(width: 50)
                }
            }
            .frame(width: 470, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)
            Rectangle()
                .foregroundColor(Color("bajuyona"))
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)
                .overlay(
                    Text("?")
                        .font(.custom("Tung2-Regular", size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("font"))
                        .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)
                )
        }
    }
}
