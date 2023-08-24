//
//  WelcomeScreen.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 11/04/23.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @State var isAnimating: Bool = false

    var body: some View {
        NavigationView{
            ZStack {
                Image("light_astro")
                    .resizable()
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                
                Image("astro")
                    .resizable()
                
                Image("light_arith")
                    .resizable()
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)

                Image("arithmetic")
                    .resizable()
                
                Image("light_button")
                    .resizable()
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                    .onAppear{
                        withAnimation{isAnimating = true}
                    }
                
                
                NavigationLink(destination: PlayView()) {
                    Image("play_button3")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle.degrees(isAnimating ? 10 : -10))
                        .onAppear{
                            isAnimating = true
                        }
                        .animation(.easeOut(duration: 1).repeatForever(), value: isAnimating)
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
