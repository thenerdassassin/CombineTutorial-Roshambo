//
//  ContentView.swift
//  roshambo
//
//  Created by Brittany Schmidt on 3/24/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var options = UserOptions("Fire", "Grass", "Water")
    var body: some View {
        UserSelectionView(options: options)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
