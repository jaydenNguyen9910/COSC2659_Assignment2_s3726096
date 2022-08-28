//
//  SignInView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct SignInView: View {
    
    @AppStorage("users") var users = 0
    
    @State private var username: String = ""
    
    func validate(name: String){
        print(name)
    }

    var body: some View {
        VStack {
            HStack{
                Text("Enter you username:")
                
                TextField(
                    "User name",
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
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
