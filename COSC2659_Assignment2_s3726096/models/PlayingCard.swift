//
//  Card.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 26/08/2022.
//

import Foundation
import SwiftUI

struct PlayingCard: Identifiable {
    var id: Int
    var value: Int
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, value: Int, imageName: String){
        self.id = id
        self.value = value
        self.imageName = imageName
    }
}
