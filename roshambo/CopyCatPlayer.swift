//
//  CopyCatPlayer.swift
//  roshambo
//
//  Created by Brittany Schmidt on 4/11/20.
//  Copyright © 2020 Joshua Schmidt. All rights reserved.
//
import SwiftUI
import Combine

class CopyCatPlayer: Player {
  private var cancellableSet: Set<AnyCancellable> = []
  
  init(opponentElementPublisher: AnyPublisher<Element, Never>) {
    super.init()
    let _ = opponentElementPublisher
      .assign(to: \.element, on: self)
      .store(in: &cancellableSet)
  }
}
