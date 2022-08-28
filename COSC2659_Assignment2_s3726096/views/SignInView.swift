//
//  SignInView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct SignInView: View {
    let lightGreen = Color(red: 0.325, green: 0.651, blue: 0.369)
    let lightYellow = Color(red: 0.988, green: 0.98, blue: 0.678)
    @AppStorage("users") var users = 0
    
    @State private var username: String = ""
    
    func validate(name: String){
        print(name)
    }

    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [lightGreen, lightYellow]), startPoint: .top, endPoint: .bottom)
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
