//
//  DonutView.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 15/08/23.
//

import SwiftUI

struct DonutView: View {
    var count: Int
    var rows: Int
    var columns: Int
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<columns, id: \.self) { column in
                        let index = row * columns + column
                        if index < count {
                            Image("donat")
                                .resizable()
                                .scaledToFit()
                                .shadow(color: Color("shadow"), radius: 1, x: -2, y: 4)
                        } else {
                            Image("donat")
                                .resizable()
                                .scaledToFit()
                                .hidden()
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct DonutExplanationView: View {
    var count: Int
    var rows: Int
    var columns: Int
    var soundAction: () -> Void

    @State private var opacity: Double = 0.5

    var body: some View {
        VStack {
            ZStack {
                if opacity == 1.0 {
                    DonutView(count: count, rows: rows, columns: columns)
                        .padding()
                }
            }
            .frame(width: 150, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
            .onAppear {
                soundAction()
                opacity = 1.0
            }
            .animation(.easeInOut(duration: 0.2), value: opacity)
        }
    }
}

struct DonutView_Previews: PreviewProvider {
    static var previews: some View {
        DonutView(count: 5, rows: 3, columns: 3)
    }
}
