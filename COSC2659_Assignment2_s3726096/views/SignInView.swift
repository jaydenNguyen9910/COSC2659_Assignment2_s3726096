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
            VStack {
                HStack{
                    Text("Enter you username:")
                    
                    TextField(
                        "Username",
                        text: $username
                    )
                    .onSubmit {
                        validate(name: username)
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                }
                Button {
                    validate(name: username)
                } label: {
                    Text("Sign In")
                }
            }
            
            // MARK: - SIGN-IN ERROR MODAL
            if showSignInErrorModal {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Your account does not exist! Please try again!")
                        Button {
                            self.showSignInErrorModal = false
                        } label: {
                            Text("Ok".uppercased())
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .cornerRadius(20)
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
