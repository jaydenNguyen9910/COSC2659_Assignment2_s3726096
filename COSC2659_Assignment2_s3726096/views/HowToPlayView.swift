//
//  HowToPlayView.swift
//  COSC2659_Assignment2_s3726096
//
//  Created by Tri Nguyen on 27/08/2022.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        Form {
          Section(header: Text("Game Rules")) {
              Text("- After the cards are dealed, you will have to calculate the sum of your three cards, then modulus 10, and compare with the bookie's.\n- If it is larger than the bookie's, you win.\n- If it is equal to the bookie's, you tie.\n- If it is smaller than the bookie's, you lose.")
        }
        Section(header: Text("How To Play")) {
            Text("Click 'Deal' cards to play.\nClick 'Reset' to start a new match.\nClick 'Show' to show your cards.\nYou can click on your dealed ones to flip them.\nYou can select your betting amount between 10 and 20:\n- In normal mode, the winning/losing amount will be your betting amount.\n- In risky mode, everything will be doubled.")
            }
            Section(header: Text("Application Information")) {
                HStack {
                  Text("App Name")
                  Spacer()
                  Text("Three cards poker")
                }
                HStack {
                  Text("Course")
                  Spacer()
                  Text("COSC2659")
                }
                HStack {
                  Text("Year Published")
                  Spacer()
                  Text("2022")
                }
                HStack {
                  Text("Location")
                  Spacer()
                  Text("Saigon South Campus")
                }
          }
        }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
