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
    @ObservedObject var options = UserOptions("Option 1", "Option 2", "Option 3")
    var body: some View {
        VStack() {
            Spacer()
            RoshamboOption(name: "Option 1", color: Color.red, options: options)
            Spacer()
            RoshamboOption(name: "Option 2", color: Color.green, options: options)
            Spacer()
            RoshamboOption(name: "Option 3", color: Color.blue, options: options)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
