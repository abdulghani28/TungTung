//
//  splashView.swift
//  mcOne
//
//  Created by Luthfi Asmara on 16/03/23.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isSplash = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                Image("Logotung")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.3)
                    .opacity(isSplash ? 0.0 : 1.0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isSplash = true
                            }
                        }
                    }
                if isSplash {
                    HomeView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
