//
//  MenuView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct MenuView: View {
    @Binding var username: String
        
    var body: some View {
        NavigationView {
            ZStack{
                // MARK: - BACKGROUND
                LinearGradient(gradient: Gradient(colors: [Color("intro-background-start"), Color("intro-background-end")]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //Logo
                    LogoView(logoFileName: "poker")
                    
                    Text("Hi " + username + "!!!")
                        .font(.headline)
                        .fontWeight(.heavy)
                    
                    NavigationLink {
                        GameView(username)
                    } label: {
                        Text("Play game")
                            .fontWeight(.heavy)
                            .modifier(textModifier())
                    }
                    .modifier(buttonModifier())
                    
                    NavigationLink {
                        HowToPlayView()
                    } label: {
                        Text("How to play")
                            .fontWeight(.heavy)
                            .modifier(textModifier())
                    }
                    .modifier(buttonModifier())
                    
                    NavigationLink {
                        LeaderBoardView()
                    } label: {
                        Text("Leader Board")
                            .fontWeight(.heavy)
                            .modifier(textModifier())
                    }
                    .modifier(buttonModifier())
                }
            }
            .onAppear(perform: {
                    playSound(sound: "Loyalty_Freak_Music_-_04_-_Cant_Stop_My_Feet_", type: "mp3")
            })
        }
        .ignoresSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(username: .constant("test"))
        
        MenuView(username: .constant("test")).environment(\.colorScheme, .dark)
    }
}
