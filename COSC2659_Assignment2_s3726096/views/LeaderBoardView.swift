//
//  LeaderBoardView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    
    @State private var userList: [User] = []
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("intro-background-start"), Color("intro-background-end")]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Image("podium")
                List {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("User")
                        }
                        .frame(width: 75)
                        Spacer()
                        Text("Score")
                        Spacer()
                        Text("Badge")
                    }
                    ForEach(userList) { user in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                            }
                            .frame(width: 75)
                            Spacer()
                            Text(String(user.highscore))
                            Spacer()
                            user.rankingImage
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
            .frame(alignment: .center)
            .onAppear(perform: {
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
        })
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
