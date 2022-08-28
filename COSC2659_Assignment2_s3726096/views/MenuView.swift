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
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color.white)
                    )
                    
                    NavigationLink {
                        HowToPlayView()
                    } label: {
                        Text("How to play")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                    }
                    
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color.white)
                    )
                    
                    NavigationLink {
                        LeaderBoardView()
                    } label: {
                        Text("Leader Board")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color.white)
                    )
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
