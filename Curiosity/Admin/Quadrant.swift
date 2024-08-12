// Created by manny_lopez on 8/11/24.

import Foundation

enum Quadrant: CaseIterable {
  case SE, SW, NW, NE

  static func randomQuadrant() -> Quadrant {
    Quadrant.allCases.randomElement()!
  }
}
