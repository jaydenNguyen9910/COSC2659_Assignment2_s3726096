//
//  LeaderBoardView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    
    private var userList: [User] = []
    
    init() {
        let users: [String:Int] = UserDefaults.standard.object(forKey: "users") as? [String:Int] ?? [:]
        for (index, user) in users.enumerated() {
            var userRank = ""
            if user.value <= 150 {
                userRank = "third"
            }
            else if user.value <= 200 {
                userRank = "second"
            }
            else {
                userRank = "first"
            }
            userList.append(User(id: index, name: user.key, highscore: user.value, rankingImageName: userRank))
        }
        userList = userList.sorted(by: { $0.highscore > $1.highscore })
    }
    
    var body: some View {
        ForEach(userList) { user in
            HStack {
                Text(user.name)
                Text(String(user.highscore))
                user.rankingImage
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
