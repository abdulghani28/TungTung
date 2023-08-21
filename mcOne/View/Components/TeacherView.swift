//
//  TeacherView.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 12/08/23.
//

import SwiftUI

struct TeacherView: View {
    var body: some View {
        VStack {
            Image("teacher")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .shadow(color: Color("shadow").opacity(0.6), radius: 2, x: -2, y: 4)
        }
    }
}
