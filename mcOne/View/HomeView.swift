//
//  homeView.swift
//  mcOne
//
//  Created by Luthfi Asmara on 16/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                    }
                    ZStack {
                        ButtonLinksStack()
                    }
                    .frame(width: 300, height: 10)
                    Spacer()
                }
                .frame(height: 300)
            }
            .shadow(color: Color("shadow").opacity(0.6), radius: 2, x: -2, y: 4)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            SoundService.instance.playBackgroundSound("normal")
        }
    }
}

struct ButtonLinksStack: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: AdditionQuestionView()) {
                    ButtonImage(name: "Button-Tambah")
                }
                NavigationLink(destination: SubtractionQuestionView()) {
                    ButtonImage(name: "Button-Kurang")
                }
                .padding(.leading)
            }
        }
    }
}

struct ButtonImage: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(height: 50)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
