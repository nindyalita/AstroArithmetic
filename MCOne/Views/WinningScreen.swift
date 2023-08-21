//
//  WinningScreen.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 11/04/23.
//

import SwiftUI

struct WinningScreen: View {
    @StateObject private var winningViewModel = WinningViewModel()
    
    var body: some View {
        VStack {
            NavigationView{
                Image("helmet3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.top, 40)
                
                NavigationLink(destination: WelcomeScreen()) {
                    Button {
                        winningViewModel.replayGame.toggle()
                    } label: {
                        Image("replayGameButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                    }
                    .padding(.vertical, 10)
                }
            }
            .position(x: 380, y: 210)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("BgWinningScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
            
        }
        
    }
}

struct WinningScreen_Previews: PreviewProvider {
    static var previews: some View {
        WinningScreen()
    }
}
