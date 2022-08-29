//
//  SignInView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var active: Bool
    @Binding var username: String
    
    @State private var showSignInErrorModal = false
    @State private var users: [String:Int] = [:]
    
    func validate(name: String) {
        users = UserDefaults.standard.object(forKey: "users") as? [String:Int] ?? [:]
        if users.keys.contains(name) {
            self.showSignInErrorModal = false
            self.active = false
        }
        else {
            self.showSignInErrorModal = true
        }
    }

    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("intro-background-start"), Color("intro-background-end")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //App name
                Image("three-cards-poker-logo")
                    .resizable()
                    .frame(width: 200, height: 100)
                
                //Logo
                LogoView(logoFileName: "poker")
                
                HStack{
                    TextField(
                        "",
                        text: $username
                    )
                    .onSubmit {
                        validate(name: username)
                    }
                    .modifier(textFieldModifier())
                }
                Button {
                    validate(name: username)
                } label: {
                    Text("Sign In")
                        .modifier(textModifier())
                }
                .modifier(buttonModifier())
            }
            
            // MARK: - SIGN-IN ERROR MODAL
            if showSignInErrorModal {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Your account does not exist!\nPlease try again!")
                            .modifier(textModifier())
                        Button {
                            self.showSignInErrorModal = false
                        } label: {
                            Text("Ok".uppercased())
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                        }
                        .modifier(buttonModifier())
                    }
                    .frame(maxWidth: 250, maxHeight: 120, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("button-background"), lineWidth: 1)
                    ).background(RoundedRectangle(cornerRadius: 40).fill(Color("button-background")))
                }// ZStack 
            }
        } //ZStack
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(active: .constant(true), username: .constant("test"))
    }
}
