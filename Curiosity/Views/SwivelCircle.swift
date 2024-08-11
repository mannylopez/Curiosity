// Created by manny_lopez on 8/9/24.

import SwiftUI

// MARK: - Swivel

struct SwivelCircle: View, Demo {

  // MARK: Lifecycle

  init(currentQuadrant: Quadrant) {
    self.currentQuadrant = currentQuadrant
    switch currentQuadrant {
    case .SE:
      _shouldShowSE = State(initialValue: true)
    case .SW:
      _shouldShowSW = State(initialValue: true)
    case .NW:
      _shouldShowNW = State(initialValue: true)
    case .NE:
      _shouldShowNE = State(initialValue: true)
    }
  }

  // MARK: Internal

  @State var currentQuadrant: Quadrant

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

      Button(action: {
        toggleQuadrant()
      }, label: {
        Text("")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      })
    }
  }

  // MARK: Private

  @State private var shouldShowSE = false
  @State private var shouldShowSW = false
  @State private var shouldShowNW = false
  @State private var shouldShowNE = false

  private func toggleQuadrant() {
    switch currentQuadrant {
    case .SE:
      currentQuadrant = .SW
      shouldShowSE.toggle()
      shouldShowSW.toggle()

    case .SW:
      currentQuadrant = .NW
      shouldShowSW.toggle()
      shouldShowNW.toggle()

    case .NW:
      currentQuadrant = .NE
      shouldShowNW.toggle()
      shouldShowNE.toggle()

    case .NE:
      currentQuadrant = .SE
      shouldShowNE.toggle()
      shouldShowSE.toggle()
    }
  }
}



#Preview {
  SwivelCircle(currentQuadrant: .NE)
}

// MARK: - Quadrant

enum Quadrant: CaseIterable {
  case SE, SW, NW, NE
}
