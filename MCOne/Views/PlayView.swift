//
//  PlayView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import SwiftUI

struct PlayView: View {
    
    @StateObject private var playViewModel = PlayViewModel()
    
    var body: some View {
        NavigationView(){
            ZStack{
                NavigationLink(destination: WinningScreen(), isActive: $playViewModel.isGameFinished){}
                
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
                                Image(playViewModel.imageName)
                                    .resizable()
                                    .frame(width: 350, height: 190)
                                
                                QuestionView(question: $playViewModel.question, isShowAlert: $playViewModel.isShowFalseAlert, sumCorrectAns: $playViewModel.sumCorrectAns, isGameFinished: $playViewModel.isGameFinished, isShowCorrectAlert: $playViewModel.isShowCorrectAlert)
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
                                playViewModel.isOpenGuidance.toggle()
                            })
                            
                            //replay button
                            CustomButtonView(imageButtonName: "restartButton", action: {
                                playViewModel.confirmReplayGame.toggle()
                            })
                        } //: HSTACK BUTTON
                        
                        Spacer()
                        
                        //MARK: ANSWER
                        AnswerView(question: playViewModel.question)
                    }
                }//: HSTACK
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("BgMainScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                )
                .onAppear(){
                    playViewModel.generateRandomNum()
                }
                
                //MARK: CORRECT ALERT
                if playViewModel.isShowCorrectAlert{
                    AlertView(text: "Benar!", backgroundColor: .green, foregroundColor: .white)
                        .task {
                            await playViewModel.hideAlert(timer: 1)
                        }
                }
                
                //MARK: FALSE ALERT
                if playViewModel.isShowFalseAlert{
                    AlertView(text: "Yah jawaban kamu belum tepat. Ayo coba lagi!", backgroundColor: Color("BlueLight"), foregroundColor: .white)
                        .task {
                            await playViewModel.hideAlert(timer: 3)
                        }
                }
                
                //MARK: CONFIRM REPLAY GAME
                if(playViewModel.confirmReplayGame){
                    ZStack{
                        
                        ConfirmationButtonView()
                        
                        VStack{
                            
                            HStack(){
                                
                                CustomConfirmationPropertiesView(imageButtonName: "correct_button", action: {
                                    playViewModel.generateRandomNum()
                                    playViewModel.sumCorrectAns.removeAll()
                                    playViewModel.confirmReplayGame.toggle()
                                    playViewModel.imageName = playViewModel.randomImageName()
                                })
                                
                                CustomConfirmationPropertiesView(imageButtonName: "wrong_button", action: {
                                    playViewModel.confirmReplayGame.toggle()
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
                if(playViewModel.isOpenGuidance){
                    
                    ZStack{
                        
                        ConfirmationButtonView()
                        
                        VStack{
                            
                            CustomConfirmationPropertiesView(imageButtonName: "tombolMengerti", action: {
                                playViewModel.isOpenGuidance.toggle()
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
