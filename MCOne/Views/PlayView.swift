//
//  PlayView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import SwiftUI

struct PlayView: View {
    
    @State var question: [[Number]] = []
    @State var isShowFalseAlert: Bool = false
    @State var isShowCorrectAlert: Bool = false
    @State var sumCorrectAns: [String] = []
    @State var isGameFinished: Bool = false
    @State var confirmReplayGame: Bool = false
    @State var imageName: String = "helmet3"
    @State var isOpenGuidance: Bool = true
    
    init(){
        imageName = randomImageName()
    }
    
    func randomImageName() -> String {
        let imageNames = ["helmet3", "Astronout","Glove", "Shoes", "Suit"]
        let imageName = imageNames.randomElement() ?? "helmet3"
        return imageName
    }
    
    func generateRandomNum(){
        var randomNumber : [[Number]] = []
        
        for _ in 0..<4 {
            var arrNumTemp: [Number] = []
            for _ in 0..<4{
                let tempNum1 = Int.random(in: 1..<10)
                let tempNum2 = Int.random(in: 1..<10)
                let resTemp = tempNum1 + tempNum2
                let tempData = Number(operand1: tempNum1, operand2: tempNum2, result: resTemp)
                arrNumTemp.append(tempData)
            }
            randomNumber.append(arrNumTemp)
            arrNumTemp.removeAll()
        }
        question = randomNumber
        print(question)
    }

    func hideAlert (timer: Int) async{
        try? await Task.sleep(for: .seconds(timer))
        DispatchQueue.main.async {
            self.isShowFalseAlert=false
            self.isShowCorrectAlert=false
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: WinningScreen(), isActive: $isGameFinished){}
                
                HStack{
                    
                    //MARK: QUESTION
                    VStack{
                        
                        Spacer()
                        
                        VStack{
                            
                            Text("Penjumlahan")
                                .font(.system(size: 24))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(.white))
                            
                            ZStack{
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 350, height: 190)
                                
                                QuestionView(question: $question, isShowAlert: $isShowFalseAlert, sumCorrectAns: $sumCorrectAns, isGameFinished: $isGameFinished, isShowCorrectAlert: $isShowCorrectAlert)
                            }
                            .frame(maxWidth: 347, maxHeight: 202)
                        }
                        .padding(.horizontal, 10)
                        .frame(maxWidth: 387, maxHeight: 300)
                        .background(Color("PurpleDark"))
                        .cornerRadius(10)
                    }// : VSTACK
                    
                    Spacer()
                    
                    VStack{
                        
                        //MARK: BUTTON
                        HStack(alignment: .bottom){
                            
                            Spacer()
                            
                            //guide button
                            CustomButtonView(imageButtonName: "helpButton", action: {
                                isOpenGuidance.toggle()
                            })
                            
                            //replay button
                            CustomButtonView(imageButtonName: "restartButton", action: {
                                confirmReplayGame.toggle()
                            })
                        } //: HSTACK BUTTON
                        
                        Spacer()
                        
                        //MARK: ANSWER
                        AnswerView(question: question)
                    }
                }//: HSTACK
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("BgMainScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                )
                .onAppear(){
                    generateRandomNum()
                }
                
                //MARK: CORRECT ALERT
                if isShowCorrectAlert{
                    AlertView(text: "Benar!", backgroundColor: .green, foregroundColor: .white)
                        .task {
                            await hideAlert(timer: 1)
                        }
                }
                
                //MARK: FALSE ALERT
                if isShowFalseAlert{
                    AlertView(text: "Yah jawaban kamu belum tepat. Ayo coba lagi!", backgroundColor: Color("BlueLight"), foregroundColor: .white)
                        .task {
                            await hideAlert(timer: 3)
                        }
                }
                
                //MARK: CONFIRM REPLAY GAME
                if(confirmReplayGame){
                    ZStack{
                        
                        ConfirmationButtonView()
                        
                        VStack{
                            
                            HStack(){
                                
                                CustomConfirmationPropertiesView(imageButtonName: "correct_button", action: {
                                    generateRandomNum()
                                    sumCorrectAns.removeAll()
                                    confirmReplayGame.toggle()
                                    imageName = randomImageName()
                                })
                                
                                CustomConfirmationPropertiesView(imageButtonName: "wrong_button", action: {
                                    confirmReplayGame.toggle()
                                })
                                
                            }
                            .position(x:380, y:260)
                        }.background(Image("ImgAlert")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400).ignoresSafeArea(.all)
                        )
                    }
                    
                }
                
                //MARK: CONFIRM OPEN GUIDE
                if(isOpenGuidance){
                    
                    ZStack{
                        
                        ConfirmationButtonView()
                        
                        VStack{
                            
                            CustomConfirmationPropertiesView(imageButtonName: "tombolMengerti", action: {
                                isOpenGuidance.toggle()
                            })
                            .position(x:380, y:290)
                            
                        }.background(Image("guidanceAlert")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400).ignoresSafeArea(.all)
                        )
                    }
                    
                }
            }//: ZSTACK
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
