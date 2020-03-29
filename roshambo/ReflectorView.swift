//
//  ReflectorView.swift
//  roshambo
//
//  Created by Brittany Schmidt on 3/27/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//

import SwiftUI
import Combine


struct ReflectorView: View {
    @ObservedObject var options: UserOptions
    @State var reflectorSelection = ""
    @State var resultText = ""
    
    var body: some View {
        VStack {
            Text("Reflector chooses...")
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.vertical, 10)
            Text(reflectorSelection)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .onReceive(options.reflectorSelection) { valueToCopy in
                    self.reflectorSelection = ""
                    self.resultText = ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if !valueToCopy.isEmpty {
                            self.reflectorSelection = valueToCopy
                            self.resultText = "Tie!"
                        }
                    }
                }
            Text(resultText)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
        }
        .padding(10)
        .background(Color.gray.opacity(0.4))
        .border(Color.black, width: 2)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}

struct ReflectorView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectorView(options: UserOptions("Option 1"))
    }
}
