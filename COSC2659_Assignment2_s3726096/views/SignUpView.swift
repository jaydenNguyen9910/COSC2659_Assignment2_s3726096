//
//  SignUpView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var active: Bool
    @Binding var username: String
    
    @State private var showSignUpErrorModal = false
    @State private var users: [String:Int] = UserDefaults.standard.object(forKey: "users") as? [String:Int] ?? [:]
    
    func validate(name: String) -> Bool {
        if users.keys.contains(name) {
            return false
        }
        else {
            return true
        }
    }
    
    func register(name: String){
        if validate(name: name) {
            users[name] = 100
            UserDefaults.standard.set(self.users, forKey: "users")
            self.active = false
        }
        else {
            showSignUpErrorModal = true
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
                    VStack{
                        Text("Enter you username:")
                            .modifier(textModifier())
                    }
                    .modifier(buttonModifier())
                    
                    TextField(
                        "",
                        text: $username
                    )
                    .onSubmit {
                        register(name: username)
                    }
                    .modifier(textFieldModifier())
                }
                Button {
                    register(name: username)
                } label: {
                    Text("Register")
                        .modifier(textModifier())
                }
                .modifier(buttonModifier())
            } //VStack
            
            // MARK: - SIGN-IN ERROR MODAL
            if showSignUpErrorModal {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Your input username is already in use! Please try another one!")
                        Button {
                            self.showSignUpErrorModal = false
                        } label: {
                            Text("Ok".uppercased())
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .cornerRadius(20)
                }// ZStack
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(active: .constant(true), username: .constant("test"))
    }
}
