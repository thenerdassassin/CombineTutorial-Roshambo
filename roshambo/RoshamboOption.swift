//
//  RoshamboOption.swift
//  roshambo
//
//  Created by Brittany Schmidt on 3/26/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//

import SwiftUI

struct RoshamboOption: View {
    var name: String
    var color: Color
    var options: UserOptions?
    
    var body: some View {
        Button(action: {
            self.options!.selectedOption = self.name
        }) {
            Text(name)
                .font(.title)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                .background(color)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.black, lineWidth: 3)
                )
        }
    }
}

struct RoshamboOption_Previews: PreviewProvider {
    static var previews: some View {
        RoshamboOption(
            name: "Option",
            color: Color.green)
    }
}
