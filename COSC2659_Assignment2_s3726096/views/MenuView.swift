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
            VStack{
                Text("Hi " + username + "!!!")
                NavigationLink {
                    GameView(username)
                } label: {
                    Text("Play game")
                }
                
                NavigationLink {
                    HowToPlayView()
                } label: {
                    Text("How to play")
                }
                
                NavigationLink {
                    LeaderBoardView()
                } label: {
                    Text("Leader Board")
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(username: .constant("test"))
    }
}
