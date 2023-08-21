//
//  WelcomeScreen.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 11/04/23.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @StateObject private var welcomeViewModel = WelcomeViewModel()

    var body: some View {
        NavigationView{
            ZStack {
                
                Image("light_astro")
                    .resizable()
                    .opacity(welcomeViewModel.isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: welcomeViewModel.isAnimating)
                
                Image("astro")
                    .resizable()
                
                Image("light_arith")
                    .resizable()
                    .opacity(welcomeViewModel.isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: welcomeViewModel.isAnimating)

                Image("arithmetic")
                    .resizable()
                
                Image("light_button")
                    .resizable()
                    .opacity(welcomeViewModel.isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: welcomeViewModel.isAnimating)
                    .onAppear{
                        withAnimation{welcomeViewModel.isAnimating = true}
                    }
                
                NavigationLink(destination: PlayView()) {
                    Image("play_button3")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle.degrees(welcomeViewModel.isAnimating ? 10 : -10))
                        .onAppear{
                            welcomeViewModel.isAnimating = true
                        }
                        .animation(.easeOut(duration: 1).repeatForever(), value: welcomeViewModel.isAnimating)
                }
                .offset(y: 75)
            }
            .background(Image("BgWelcomeScreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all ))
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
