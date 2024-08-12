// Created by manny_lopez on 8/9/24.

import SwiftUI

// MARK: - Swivel

struct SwivelCircle: View, Demo {

  // MARK: Lifecycle

  init(currentQuadrant: Quadrant) {
    self.currentQuadrant = currentQuadrant
    switch currentQuadrant {
    case .SE:
      shouldShowSE = true
    case .SW:
      shouldShowSW = true
    case .NW:
      shouldShowNW = true
    case .NE:
      shouldShowNE = true
    }
  }

  // MARK: Internal

  let id = UUID()
  let name = "Swivel Circle"

  var body: some View {
    ZStack {
      PieSegment(start: .zero, end: .degrees(90))
        .fill(.blue)
        .opacity(shouldShowSE ? 1.0 : 0)
      PieSegment(start: .degrees(90), end: .degrees(180))
        .fill(.green)
        .opacity(shouldShowSW ? 1.0 : 0)
      PieSegment(start: .degrees(180), end: .degrees(270))
        .fill(.yellow)
        .opacity(shouldShowNW ? 1.0 : 0)
      PieSegment(start: .degrees(270), end: .degrees(360))
        .fill(.red)
        .opacity(shouldShowNE ? 1.0 : 0)

      PieSegment(start: .degrees(0), end: .degrees(360))
        .fill(.clear)
        .overlay {
          Circle()
            .fill(.clear)
            .stroke(Color(.systemGray5))
        }
    }
  }

  // MARK: Private

  private var currentQuadrant: Quadrant

  private var shouldShowSE = false
  private var shouldShowSW = false
  private var shouldShowNW = false
  private var shouldShowNE = false
}



#Preview {
  SwivelCircle(currentQuadrant: Quadrant.randomQuadrant())
}
