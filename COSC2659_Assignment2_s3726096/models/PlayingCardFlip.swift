//
//  PlayingCardFlip.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 26/08/2022.
//

import SwiftUI

struct PlayingCardFlip: View {
    
    var backSide: Image
    
    var frontSide: Image
    
    @State private var animating = false
    @State private var isCardFlipped = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            if isCardFlipped {
                frontSide
                    .resizable()
                    .modifier(cardModifier())
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            else {
                backSide
                    .resizable()
                    .modifier(cardModifier())
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.3)) {
                self.animating.toggle()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                if self.animating {
                    withAnimation(Animation.linear(duration: 0.01)) {
                        self.rotation += 3
                    }
                    if self.rotation == 90 || self.rotation == 270 {
                        self.isCardFlipped.toggle()
                    }
                    else if self.rotation == 360 || self.rotation == 180 {
                        self.animating = false
                    }
                                    
                    if self.rotation == 360 {
                        self.rotation = 0
                    }
                }
            }
        }
    }
}

struct PlayingCardFlip_Previews: PreviewProvider {
    static var previews: some View {
        PlayingCardFlip(backSide: playingCards[0].image, frontSide: playingCards[1].image)
    }
}
