//
//  answerButton.swift
//  mcOne
//
//  Created by Luthfi Asmara on 30/03/23.
//

import SwiftUI

struct AnswerButton: View {
    var number: Int
    let image = "donat"
    var body: some View {
        let columns = Int(ceil(sqrt(Double(number))))
        let rows = Int(ceil(Double(number) / Double(columns)))

        return ZStack {
            Color("bajuyona")
            DonutView(count: number, rows: rows, columns: columns)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 180, height: 120)
        .shadow(color: Color("shadow") .opacity(0.6), radius: 2, x: -2, y: 4)

    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AdditionQuestionView()
    }
}
