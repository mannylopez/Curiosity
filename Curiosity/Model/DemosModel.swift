// Created by manny_lopez on 8/9/24.

import Foundation
import SwiftUI

struct DemosModel {
  static func randomQuadrant() -> Quadrant {
    Quadrant.allCases.randomElement()!
  }
  let demos = [Swivel(currentQuadrant: randomQuadrant())]
}
