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
                    VStack{
                        NavigationLink {
                            SignInView(active: $isSignInViewActive, username: $username)
                        } label: {
                            Text("Sign in")
                        }
                        
                        NavigationLink {
                            SignUpView(active: $isSignUpViewActive, username: $username)
                        } label: {
                            Text("Don't have an account? Please sign up!")
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
    }
}
