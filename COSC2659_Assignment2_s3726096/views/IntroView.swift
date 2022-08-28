//
//  IntroView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - BACKGROUND
                LinearGradient(gradient: Gradient(colors: [ColorConstants.lightGreen, ColorConstants.lightYellow]), startPoint: .top, endPoint: .bottom)
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
