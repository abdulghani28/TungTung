//
//  textStyle.swift
//  mcOne
//
//  Created by Luthfi Asmara on 16/03/23.
//

import SwiftUI

extension View {
    func blackTextB30() -> some View {
        self.font(
            .custom(
            "Arial",
            fixedSize: 30)
            .weight(.bold)).foregroundColor(Color .black)
    }
    func blackTextB20() -> some View {
        self.font(
            .custom(
            "Arial",
            fixedSize: 20)
            .weight(.bold)).foregroundColor(Color .black)
    }
    func blackTextB15() -> some View {
        self.font(
            .custom(
            "Arial",
            fixedSize: 15)
            .weight(.bold)).foregroundColor(Color .black)
    }
    func blackTextM17() -> some View {
        self.font(
            .custom(
            "Arial",
            fixedSize: 17)
            .weight(.medium)).foregroundColor(Color .black)
    }
    func whiteTextB15() -> some View {
        self.font(
            .custom(
            "SFPro",
            fixedSize: 15)
            .weight(.bold)).foregroundColor(Color .white)
    }

}
