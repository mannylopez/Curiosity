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
    if let colorScheme = colors[.ocean] {
      ZStack {
        PieSegment(start: .zero, end: .degrees(90))
          .fill(colorScheme[0])
          .opacity(shouldShowSE ? 1.0 : 0)
        PieSegment(start: .degrees(90), end: .degrees(180))
          .fill(colorScheme[1])
          .opacity(shouldShowSW ? 1.0 : 0)
        PieSegment(start: .degrees(180), end: .degrees(270))
          .fill(colorScheme[2])
          .opacity(shouldShowNW ? 1.0 : 0)
        PieSegment(start: .degrees(270), end: .degrees(360))
          .fill(colorScheme[3])
          .opacity(shouldShowNE ? 1.0 : 0)

        PieSegment(start: .degrees(0), end: .degrees(360))
          .fill(.clear)
          .overlay {
            Circle()
              .fill(.clear)
              .stroke(Color(.systemGray5))
          }
      }
    } else {
      EmptyView()
    }
  }

  // MARK: Private

  private let colors: [ColorScheme: [Color]] = [
    .peach: [
      Color(hex: "#FFEADD"),
      Color(hex: "#FCAEAE"),
      Color(hex: "FF8989"),
      Color(hex: "FF6666"),
    ],
    .tron: [
      Color(hex: "#DF7212"),
      Color(hex: "#E6FFFF"),
      Color(hex: "#0C141F"),
      Color(hex: "#6FC3DF"),
    ],
    .neon: [
      Color(hex: "#711c91"),
      Color(hex: "#ea00d9"),
      Color(hex: "#0abdc6"),
      Color(hex: "#133e7c"),
    ],
    .green: [
      Color(hex: "#C9DABF"),
      Color(hex: "#9CA986"),
      Color(hex: "#808D7C"),
      Color(hex: "#5F6F65"),
    ],
    .rgb: [
      .red,
      .green,
      .blue,
      .yellow,
    ],
    .black: [
      .black,
      .black,
      .black,
      .black,
    ],
    .rain: [
      Color(hex: "#402E7A"),
      Color(hex: "#4C3BCF"),
      Color(hex: "#4B70F5"),
      Color(hex: "#3DC2EC"),
    ],
    .seafoam: [
      Color(hex: "#D8EFD3"),
      Color(hex: "#95D2B3"),
      Color(hex: "#55AD9B"),
      Color(hex: "#F1F8E8"),
    ],
    .ocean: [
      Color(hex: "#050C9C"),
      Color(hex: "#3572EF"),
      Color(hex: "#3ABEF9"),
      Color(hex: "#A7E6FF"),
    ],
  ]

  private var currentQuadrant: Quadrant

  private var shouldShowSE = false
  private var shouldShowSW = false
  private var shouldShowNW = false
  private var shouldShowNE = false

  enum ColorScheme {
    case peach
    case tron
    case neon
    case green
    case rgb
    case black
    case rain
    case seafoam
    case ocean
  }
}



#Preview {
  SwivelCircle(currentQuadrant: Quadrant.randomQuadrant())
}
