//
//  UserSelection.swift
//  roshambo
//
//  Created by Brittany Schmidt on 3/26/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//

import Foundation
import Combine

class UserOptions: ObservableObject {
    private var options: [String] = []

    @Published var selectedOption: String = "Make Your Choice"
    
    init(_ options: String...) {
        options.forEach {
            self.options.append($0)
        }
    }
}
