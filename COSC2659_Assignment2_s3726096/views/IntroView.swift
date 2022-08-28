//
//  IntroView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct IntroView: View {
    let lightGreen = Color(red: 0.325, green: 0.651, blue: 0.369)
    let lightYellow = Color(red: 0.988, green: 0.98, blue: 0.678)
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - BACKGROUND
                LinearGradient(gradient: Gradient(colors: [lightGreen, lightYellow]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sign in")
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
                        SignUpView()
                    } label: {
                        Text("Don't have an account? Please sign up!")
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
