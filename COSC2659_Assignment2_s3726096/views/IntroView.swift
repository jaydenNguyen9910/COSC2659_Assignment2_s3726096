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
            VStack{
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Sign in")
                }
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Don't have an account? Please sign up!")
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
