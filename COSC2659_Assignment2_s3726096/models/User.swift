//
//  User.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 28/08/2022.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var highscore: Int
    var rankingImageName: String
    var rankingImage: Image {
        Image(rankingImageName)
    }
    
    init(id: Int, name: String, highscore: Int, rankingImageName: String) {
        self.id = id
        self.name = name
        self.highscore = highscore
        self.rankingImageName = rankingImageName
    }
}
