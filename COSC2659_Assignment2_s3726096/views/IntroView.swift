//
//  IntroView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct IntroView: View {
    
    @State var isSignInViewActive: Bool = true
    
    @State var isSignUpViewActive: Bool = true
    
    @State var username: String = ""
    
    var body: some View {
        ZStack {
            if isSignInViewActive && isSignUpViewActive {
                NavigationView {
                    ZStack {
                        // MARK: - BACKGROUND
                        LinearGradient(gradient: Gradient(colors: [Color("intro-background-start"), Color("intro-background-end")]), startPoint: .leading, endPoint: .trailing)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack{
                            //App name
                            Image("three-cards-poker-logo")
                                .resizable()
                                .frame(width: 200, height: 100)
                            
                            //Logo
                            LogoView(logoFileName: "poker")
                            
                            NavigationLink {
                                SignInView(active: $isSignInViewActive, username: $username)
                            } label: {
                                Text("Sign in")
                                    .fontWeight(.heavy)
                                    .modifier(textModifier())
                            }
                            .modifier(buttonModifier())
                            
                            NavigationLink {
                                SignUpView(active: $isSignUpViewActive, username: $username)
                            } label: {
                                Text("Don't have an account? Please sign up!")
                                    .fontWeight(.heavy)
                                    .modifier(textModifier())
                            }
                            .modifier(buttonModifier())
                        }
                    }
                }
            }
            else {
                MenuView(username: $username)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
        
        IntroView().environment(\.colorScheme, .dark)
    }
}
