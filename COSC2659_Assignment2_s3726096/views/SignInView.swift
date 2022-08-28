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
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [ColorConstants.lightGreen, ColorConstants.lightYellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    TextField(
                        "Enter you username",
                        text: $username
                    )
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color.white)
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
