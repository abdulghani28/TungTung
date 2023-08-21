import SwiftUI

struct SubtractionExplanationView: View {
    var num1: Int
    var num2: Int
    var answer: Int
    @State var stepOne: Bool = false
    @State var stepTwo: Bool = false
    @State var stepThree: Bool = false
    @State var stepFour: Bool = false
    @State var stepFive: Bool = false
    @State private var isShowing = false
    var body: some View {
        let firstColumns = Int(ceil(sqrt(Double(num1))))
        let firstRows = Int(ceil(Double(num1) / Double(firstColumns)))
        let secondColumns = Int(ceil(sqrt(Double(num2))))
        let secondRows = Int(ceil(Double(num2) / Double(secondColumns)))
        let thirdColumns = Int(ceil(sqrt(Double(answer))))
        let thirdRows = Int(ceil(Double(answer) / Double(thirdColumns)))
        ZStack {
            Image("bg")
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 8)
            if !isShowing {
                Color.clear
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isShowing = true
                            }
                        }
                    }
            }
            if isShowing {
                withAnimation(.easeInOut(duration: 0.5)) {
                    ZStack {
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 120, height: 40)
                                .foregroundColor(Color("question-mark"))
                                .overlay(
                                    Text("Penjelasan")
                                        .font(.custom("Tung2-Regular", size: 20))
                                        .foregroundColor(Color("font"))
                                )
                            ZStack {
                                Color("explanation")
                                VStack {
                                    HStack {
                                        SubtractionStepView(
                                            isVisible: stepOne,
                                            type: "question",
                                            count: num1,
                                            rows: firstRows,
                                            columns: firstColumns,
                                            soundType: String(num1),
                                            stepAction: { stepTwo = true }
                                        )
                                        SubtractionStepView(
                                            isVisible: stepTwo,
                                            type: "operation",
                                            count: num2,
                                            rows: secondRows,
                                            columns: secondColumns,
                                            soundType: "Dikurang",
                                            stepAction: { stepThree = true }
                                        )
                                        SubtractionStepView(
                                            isVisible: stepThree,
                                            type: "question",
                                            count: num2,
                                            rows: secondRows,
                                            columns: secondColumns,
                                            soundType: "\(num2)",
                                            stepAction: { stepFour = true }
                                        )
                                    }
                                    HStack {
                                        SubtractionStepView(
                                            isVisible: stepFour,
                                            type: "equal",
                                            count: answer,
                                            rows: thirdRows,
                                            columns: thirdColumns,
                                            soundType: "samaDengan",
                                            stepAction: {
                                                stepFive = true
                                                SoundService.instance.playSpecialSound("nahMinus")
                                            }
                                        )
                                        SubtractionStepView(
                                            isVisible: stepFive,
                                            type: "answer",
                                            count: answer,
                                            rows: thirdRows,
                                            columns: thirdColumns,
                                            soundType: "\(answer)",
                                            stepAction: {}
                                        )
                                    }
                                }
                                .frame(width: 350, height: 250)
                                .offset(x: -10)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .frame(width: 500, height: 300)
                        }
                        .offset(x: -70)
                        Image("teacher")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 400, alignment: .trailing)
                            .offset(x: 200, y: 30)
                    }
                    .opacity(isShowing ? 1 : 0)
                    .transition(.opacity)
                }
            }
        }
        .onAppear {
            SoundService.instance.playSpecialSound("mariKitaHitungBersama")
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                stepOne = true
            }
        }
    }
}

struct SubtractionExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionExplanationView(num1: 3, num2: 2, answer: 1)
    }
}
