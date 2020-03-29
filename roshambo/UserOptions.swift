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
    private let options: [String]
    @Published var selectedOption: String = ""
    
    init(_ options: String...) {
        var providedOptions: [String] = []
        options.forEach {
            providedOptions.append($0)
        }
        self.options = providedOptions
    }
}
