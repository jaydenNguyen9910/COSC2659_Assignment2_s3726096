//
//  MenuView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - BACKGROUND
                LinearGradient(gradient: Gradient(colors: [ColorConstants.lightGreen, ColorConstants.lightYellow]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    NavigationLink {
                        GameView()
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
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
