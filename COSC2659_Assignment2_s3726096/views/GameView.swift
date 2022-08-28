//
//  GameView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct GameView: View {
    
    @State var username: String
    @State private var highscore: Int
    @State private var users: [String:Int] = [:]
    
    @State private var coins = 100
    @State private var betAmount = 10
    
    @State private var cards = Array(1...52)
    @State private var bookieCards = [0, 0, 0]
    @State private var playerCards = [0, 0, 0]
    
    @State private var isDealed = false
    @State private var isShown = false
    @State private var showGameOverModal = false
    @State private var isBetting10 = true
    @State private var isBetting20 = false
    @State private var showSettingModal = false
    @State private var isNormalModeChosen = true
    @State private var isRiskyModeChosen = false
    @State private var isWinDisplayed = false
    @State private var isDrawDisplayed = false
    @State private var isLoseDisplayed = false
    
    init(_ username: String) {
        self.username = username
        let users = UserDefaults.standard.object(forKey: "users") as? [String:Int] ?? [:]
        self.users = users
        self.highscore = users[username] ?? 100
    }
    
    // MARK: - SHUFFLE CARDS
    func shuffleCards(){
        cards.shuffle()
    }
    
    // MARK: - DEAL CARDS
    func dealCards(){
        isDealed = true
        isShown = false
        shuffleCards()
        bookieCards = bookieCards.map({ _ in 0 })
        playerCards[0] = cards[3]
        playerCards[1] = cards[4]
        playerCards[2] = cards[5]
        playSound(sound: "shuffling-cards", type: "mp3")
    }
    
    // MARK: - SHOW CARDS
    func showCards(){
        isShown = true
        bookieCards[0] = cards[0]
        bookieCards[1] = cards[1]
        bookieCards[2] = cards[2]
        checkWinning()
    }
    
    // MARK: - RESET/NEW GAME
    func reset(){
        isDealed = false
        isShown = false
    }
    
    // MARK: - CHECK WINNING LOGIC
    func checkWinning(){
        let deckOfCards: Set = ["jack", "queen", "king"]
        var bookieSum = (((playingCards[bookieCards[0]].value + playingCards[bookieCards[1]].value) % 10) + playingCards[bookieCards[2]].value) % 10
        var playerSum = (((playingCards[playerCards[0]].value + playingCards[playerCards[1]].value) % 10) + playingCards[playerCards[2]].value) % 10
        
        if bookieSum == 0 {
            if deckOfCards.contains(playingCards[bookieCards[0]].imageName.components(separatedBy: "_")[0])
                && deckOfCards.contains(playingCards[bookieCards[1]].imageName.components(separatedBy: "_")[0])
                && deckOfCards.contains(playingCards[bookieCards[2]].imageName.components(separatedBy: "_")[0]) {
                bookieSum = 10
            }
        }
        
        if playerSum == 0 {
            if deckOfCards.contains(playingCards[playerCards[0]].imageName.components(separatedBy: "_")[0])
                && deckOfCards.contains(playingCards[playerCards[1]].imageName.components(separatedBy: "_")[0])
                && deckOfCards.contains(playingCards[playerCards[2]].imageName.components(separatedBy: "_")[0]) {
                playerSum = 10
            }
        }
        
        if playerSum > bookieSum {
            playerWins()
            
            // NEW HIGHSCORE LOGIC
            if coins > highscore{
                newHighScore()
            } else {
                playSound(sound: "winning", type: "mp3")
            }
        }
        else if playerSum == bookieSum {
            playSound(sound: "losingOrDraw", type: "mp3")
            isDrawDisplayed = true
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                isDrawDisplayed = false
            }
        }
        else {
            // PLAYER LOSES
            playerLoses()
        }
    }
    
    // MARK: - PLAYER WIN LOGIC
    func playerWins() {
        if isNormalModeChosen {
            coins += betAmount
        }
        else {
            coins += betAmount*2
        }
        isWinDisplayed = true
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            isWinDisplayed = false
        }
    }
    
    // MARK: - HIGHSCORE LOGIC
    func newHighScore(){
        highscore = coins
        users[username] = highscore
        UserDefaults.standard.set(users, forKey: "users")
        playSound(sound: "highscore", type: "mp3")
    }
    
    // MARK: - PLAYER LOSE LOGIC
    func playerLoses() {
        if isNormalModeChosen {
            coins -= betAmount
        }
        else {
            coins -= betAmount*2
        }
        playSound(sound: "losingOrDraw", type: "mp3")
        isLoseDisplayed = true
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            isLoseDisplayed = false
        }
        isGameOver()
    }
    
    // MARK: - GAME OVER LOGIC
    func isGameOver() {
        if coins <= 0 {
            // SHOW MODAL MESSAGE OF GAME OVER
            showGameOverModal = true
            playSound(sound: "gameover", type: "mp3")
        }
    }
    
    // MARK: - BET 20 LOGIC
    func bet20() {
        betAmount = 20
        isBetting10 = false
        isBetting20 = true
    }
    
    // MARK: - BET 10 LOGIC
    func bet10() {
        betAmount = 10
        isBetting10 = true
        isBetting20 = false
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        showSettingModal = true
                    } label: {
                        Text("Settings")
                    }
                }
                
                // MARK: - STATISTICS
                HStack{
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                    }
                    Spacer()
                    HStack{
                        Text("\(highscore)")
                            .multilineTextAlignment(.leading)
                        Text("High\nScore".uppercased())
                    }
                }// end HStack - Statistics
                
                // MARK: - BOOKIE FIELD
                VStack{
                    Text("Bookie")
                    if isDealed {
                        HStack {
                            playingCards[bookieCards[0]].image
                                .resizable()
                                .modifier(cardModifier())
                            playingCards[bookieCards[1]].image
                                .resizable()
                                .modifier(cardModifier())
                            playingCards[bookieCards[2]].image
                                .resizable()
                                .modifier(cardModifier())
                        }
                    }
                }// end VStack - Bookie field
                
                Spacer()
                
                // MARK: - BUTTON DEAL CARDS
                Button {
                    dealCards()
                } label: {
                    Text("Deal")
                }
                .disabled(isDealed)
                
                // MARK: BUTTON RESET
                Button {
                    reset()
                } label: {
                    Text("Reset")
                }
                .disabled(!isShown)
                
                Spacer()
                
                // MARK: - PLAYER FIELD
                VStack{
                    if isDealed {
                        HStack {
                            if isShown {
                                playingCards[playerCards[0]].image
                                    .resizable()
                                    .modifier(cardModifier())
                                playingCards[playerCards[1]].image
                                    .resizable()
                                    .modifier(cardModifier())
                                playingCards[playerCards[2]].image
                                    .resizable()
                                    .modifier(cardModifier())
                            }
                            else {
                                PlayingCardFlip(backSide: playingCards[0].image, frontSide: playingCards[playerCards[0]].image)
                                PlayingCardFlip(backSide: playingCards[0].image, frontSide: playingCards[playerCards[1]].image)
                                PlayingCardFlip(backSide: playingCards[0].image, frontSide: playingCards[playerCards[2]].image)
                            }
                        }
                    }
                    Text(username)
                    Button {
                        showCards()
                    } label: {
                        Text("Showdown")
                    }
                    .disabled(!isDealed || isShown)
                }// end Vstack - Player field
                
                HStack {
                    // MARK: - BET 20 BUTTON
                    Button {
                        self.bet20()
                    } label: {
                        HStack(){
                            Text("20")
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10 BUTTON
                    Button {
                        self.bet10()
                    } label: {
                        HStack(){
                            Text("10")
                        }
                    }
                }// end HStack - betting
            }
            
            // MARK: - GAMEOVER MODAL
            if showGameOverModal{
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color.red)
                        
                        Spacer()
                        
                        VStack {
                            Text("Haha!\nLoser!")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            Button {
                                self.showGameOverModal = false
                                self.coins = 100
                                reset()
                                audioPlayer?.stop()
                            } label: {
                                Text("New Game".uppercased())
                                    .foregroundColor(Color.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("ColorRedRMIT"))
                            )

                        }
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(20)
                }
                .onAppear(perform: {
                        playSound(sound: "drum-music", type: "mp3")
                })
            }// end ZStack - Gameover modal
            
            // MARK: - SETTING MODAL
            if showSettingModal {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("SETTINGS")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color.red)
                        
                        Spacer()
                        
                        VStack {
                            Text("Game modes:")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding()
                            
                            Button {
                                isNormalModeChosen = true
                                isRiskyModeChosen = false
                            } label: {
                                if isNormalModeChosen {
                                    Text("Normal")
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                }
                                else {
                                    Text("Normal")
                                        .foregroundColor(Color.white)
                                }
                            }
                            
                            Button {
                                isNormalModeChosen = false
                                isRiskyModeChosen = true
                            } label: {
                                if isRiskyModeChosen {
                                    Text("Risky")
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                }
                                else {
                                    Text("Risky")
                                        .foregroundColor(Color.white)
                                }
                            }

                            Button {
                                self.showSettingModal = false
                                audioPlayer?.stop()
                            } label: {
                                Text("Save".uppercased())
                                    .foregroundColor(Color.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color("ColorRedRMIT"))
                            )
                        }
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(20)
                }
                .onAppear(perform: {
                        playSound(sound: "drum-music", type: "mp3")
                })
            }// end ZStack - Gameover modal
            
            if isWinDisplayed {
                Text("Win")
            }
            
            if isDrawDisplayed {
                Text("Draw")
            }
            
            if isLoseDisplayed {
                Text("Lose")
            }
        }
        .navigationTitle("Game")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView("test")
    }
}
