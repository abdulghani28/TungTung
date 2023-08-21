////
////  ExampleView.swift
////  mcOne
////
////  Created by Muhammad Abdul Ghani on 16/08/23.
////
//
//    struct SubtractionExplanationView : View{
//    var num1: Int
//    var num2: Int
//    var ans: Int
//    @State var stepOne: Bool = false
//    @State var stepTwo: Bool = false
//    @State var stepThree: Bool = false
//    @State var stepFour: Bool = false
//    @State var stepFive: Bool = false
//    @State var opp1: Double = 0.5
//    @State var opp2: Double = 0.5
//    @State var opp3: Double = 0.5
//    @State private var isShowing = false
//
//    var body: some View{
//        let firstColumns = Int(ceil(sqrt(Double(num1))))
//        let firstRows = Int(ceil(Double(num1) / Double(firstColumns)))
//        let secondColumns = Int(ceil(sqrt(Double(num2))))
//        let secondRows = Int(ceil(Double(num2) / Double(secondColumns)))
//        let thirdColumns = Int(ceil(sqrt(Double(ans))))
//        let thirdRows = Int(ceil(Double(ans) / Double(thirdColumns)))
//
//        ZStack {
//            Image("bg")
//                .edgesIgnoringSafeArea(.all)
//                .blur(radius: 8)
//
//            if !isShowing {
//                Color.clear
//                    .onAppear {
//                        Timer.scheduledTimer(withTimeInterval: 0.5,  repeats: false) { _ in
//                            withAnimation(.easeInOut(duration: 0.2)) {
//                                isShowing = true
//                            }
//                        }
//                    }
//            }
//
//            if isShowing{
//                withAnimation(.easeInOut(duration: 0.5)){
//                    ZStack{
//                        VStack(alignment: .leading){
//                            RoundedRectangle(cornerRadius: 20)
//                                .frame(width: 120, height: 40)
//                                .foregroundColor(Color("question-mark"))
//                                .overlay(Text("Penjelasan")
//                                    .font(.custom("Tung2-Regular", size: 20))
//
//                                    .foregroundColor(Color("font")))
//                            ZStack {
//                                Color("explanation")
//                                VStack() {
//                                    HStack {
//                                        ZStack{
//                                            if stepOne{
//                                                VStack{
//                                                    ZStack{
//                                                        Color("cream")
//                                                        DonutView(count: num1, rows: firstRows, columns: firstColumns)
//                                                    }
//                                                    .frame(width: 150, height: 100)
//                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                    .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
//
//                                                }.opacity(opp1)
//                                                    .onAppear{
//                                                        switch num1{
//                                                        case 1:
//                                                            SoundService.instance.satuAwal()
//                                                        case 2:
//                                                            SoundService.instance.duaAwal()
//                                                        case 3:
//                                                            SoundService.instance.tigaAwal()
//                                                        case 4:
//                                                            SoundService.instance.empatAwal()
//                                                        case 5:
//                                                            SoundService.instance.limaAwal()
//                                                        case 6:
//                                                            SoundService.instance.enamAwal()
//                                                        case 7:
//                                                            SoundService.instance.tujuhAwal()
//                                                        case 8:
//                                                            SoundService.instance.delapanAwal()
//                                                        case 9:
//                                                            SoundService.instance.sembilanAwal()
//                                                        default:
//                                                            SoundService.instance.jadi()
//                                                        }
//                                                        opp1 = 1.0
//                                                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
//                                                            self.stepTwo = true
//                                                        }
//                                                    }
//                                            }
//                                        }.frame(width: 150, height: 100)
//
//                                        if stepTwo{
//                                            withAnimation(.easeInOut(duration: 0.2)){
//                                                VStack{
//                                                    Rectangle()
//                                                        .foregroundColor(Color("cream"))
//                                                        .frame(width: 40, height: 40)
//                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                        .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
//                                                        .overlay(
//                                                            Text("-")
//                                                                .font(.headline)
//                                                                .fontWeight(.medium)
//                                                                .foregroundColor(Color("font"))
//                                                        )
//                                                }
//                                                .onAppear{
//                                                    SoundService.instance.dikurang()
//                                                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
//                                                        self.stepThree = true
//                                                    }
//                                                }
//                                            }
//                                        }
//                                        ZStack{
//                                            if stepThree{
//                                                withAnimation(.easeInOut(duration: 0.2)){
//                                                    VStack{
//                                                        ZStack{
//                                                            Color("cream")
//                                                            DonutView(count: num2, rows: secondRows, columns: secondColumns)
//                                                        }
//                                                        .frame(width: 150, height: 100)
//                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                        .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
//
//
//                                                    }.opacity(opp2)
//                                                        .onAppear{
//                                                            switch num2{
//                                                            case 1:
//                                                                SoundService.instance.satuAkhir()
//                                                            case 2:
//                                                                SoundService.instance.duaAkhir()
//                                                            case 3:
//                                                                SoundService.instance.tigaAkhir()
//                                                            case 4:
//                                                                SoundService.instance.empatAkhir()
//                                                            case 5:
//                                                                SoundService.instance.limaAkhir()
//                                                            case 6:
//                                                                SoundService.instance.enamAkhir()
//                                                            case 7:
//                                                                SoundService.instance.tujuhAkhir()
//                                                            case 8:
//                                                                SoundService.instance.delapanAkhir()
//                                                            case 9:
//                                                                SoundService.instance.sembilanAkhir()
//                                                            default:
//                                                                SoundService.instance.jadi()
//                                                            }
//                                                            opp2 = 1.0
//                                                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//                                                                self.stepFour = true
//                                                            }
//                                                        }
//                                                }
//                                            }
//                                        } .frame(width: 150, height: 100)
//                                        Spacer()
//                                    }
//
//                                    HStack {
//                                        if stepFour{
//                                            withAnimation(.easeInOut(duration: 0.2)){
//                                                VStack{
//                                                    Rectangle()
//                                                        .foregroundColor(Color("bajuyona"))
//                                                        .frame(width: 40, height: 40)
//                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                        .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
//                                                        .overlay(
//                                                            Text("=")
//                                                                .font(.headline)
//                                                                .fontWeight(.medium)
//                                                                .foregroundColor(Color("font"))
//                                                        )
//                                                }.onAppear{
//                                                    SoundService.instance.samaDengan()
//                                                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
//                                                        self.stepFive = true
//                                                    }
//                                                }
//                                            }
//                                        }
//                                        ZStack{
//                                            if stepFive{
//                                                withAnimation(.easeInOut(duration: 0.2)){
//                                                    VStack{
//                                                        ZStack{
//                                                            Color("bajuyona")
//                                                            DonutView(count: ans, rows: thirdRows, columns: thirdColumns)
//                                                        }
//                                                        .frame(width: 310, height: 120)
//                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                        .shadow(color: Color("shadow"), radius: 2, x: -2, y: 4)
//
//                                                    }.opacity(opp3)
//                                                        .onAppear{
//                                                            switch ans{
//                                                            case 1:
//                                                                SoundService.instance.satuAkhir()
//                                                            case 2:
//                                                                SoundService.instance.duaAkhir()
//                                                            case 3:
//                                                                SoundService.instance.tigaAkhir()
//                                                            case 4:
//                                                                SoundService.instance.empatAkhir()
//                                                            case 5:
//                                                                SoundService.instance.limaAkhir()
//                                                            case 6:
//                                                                SoundService.instance.enamAkhir()
//                                                            case 7:
//                                                                SoundService.instance.tujuhAkhir()
//                                                            case 8:
//                                                                SoundService.instance.delapanAkhir()
//                                                            case 9:
//                                                                SoundService.instance.sembilanAkhir()
//                                                            default:
//                                                                SoundService.instance.jadi()
//                                                            }
//                                                            //                                        SoundService.instance.player?.stop()
//                                                            opp3 = 1.0
//                                                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//                                                                SoundService.instance.nahSubtraction()
//                                                            }
//                                                        }
//                                                }
//                                            }
//                                        }.frame(width: 310, height: 120)
//
//                                    }
//                                }
//                                .frame(width: 350, height: 250)
//                                .offset(x:-10)
//                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                            .frame(width:500, height: 300)
//                        }
//                        .offset(x:-70)
//                        Image("teacher")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 400, height: 400, alignment: .trailing)
//                            .offset(x: 200, y: 30)
//                    }
//                    .opacity(isShowing ? 1 : 0)
//                    .transition(.opacity)
//                }
//            }
//        }.onAppear{
//            SoundService.instance.mariKitaHitungBersama()
//            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//                self.stepOne = true
//            }
//
//        }
//    }
//}
//
//struct SubtractionExplanationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubtractionExplanationView(num1: 3, num2: 2, ans: 1)
//    }
//}
