//
//  UserSelectionView.swift
//  roshambo
//
//  Created by Brittany Schmidt on 3/27/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//

import SwiftUI

struct UserSelectionView: View {
    let options: UserOptions
    var body: some View {
        VStack() {
            Spacer()
            Text("Choose your type!")
                .font(.title)
            Spacer()
            RoshamboOption(name: "Fire", color: Color.red, options: options)
            Spacer()
            RoshamboOption(name: "Grass", color: Color.green, options: options)
            Spacer()
            RoshamboOption(name: "Water", color: Color.blue, options: options)
            Spacer()
        }
    }
}

struct UserSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserSelectionView(options: UserOptions("Option 1", "Option 2", "Option 3"))
    }
}
