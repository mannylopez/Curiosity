// Created by manny_lopez on 8/10/24.

import SwiftUI

struct SwivelScreen: View, Demo {
  let id = UUID()
  var name = "Swivel"

  private static let rows = 12
  private static let rowRange: Range<Int> = 0..<rows
  private let rowsFloat = CGFloat(SwivelScreen.rows)

  func randomQuadrant() -> Quadrant {
    Quadrant.allCases.randomElement()!
  }

  var body: some View {
    GeometryReader { proxy in
      let columns = Int(proxy.size.height / (proxy.size.width / rowsFloat))
      Grid(horizontalSpacing: 0, verticalSpacing: 0) {
        Spacer()
        ForEach(0..<columns, id: \.self) { _ in
          GridRow {
            ForEach(SwivelScreen.rowRange, id: \.self) { _ in
              Swivel(currentQuadrant: randomQuadrant())
                .frame(
                  width: proxy.size.width / rowsFloat,
                  height: proxy.size.width / rowsFloat)
            }
          }
        }
        Spacer()
      }
    }
  }
}

#Preview {
  SwivelScreen()
}
