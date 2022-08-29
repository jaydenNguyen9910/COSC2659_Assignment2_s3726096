//
//  LogoView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import SwiftUI

struct LogoView: View {
    var logoFileName: String
    
    var body: some View {
        Image(logoFileName)
            .resizable()
            .scaledToFit()
            .frame(minHeight: 130, idealHeight: 170, maxHeight: 200, alignment: .center)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logoFileName: "poker")
    }
}
