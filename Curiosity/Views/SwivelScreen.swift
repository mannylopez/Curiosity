// Created by manny_lopez on 8/10/24.

import SwiftUI

struct SwivelScreen: View, Demo {

  // MARK: Lifecycle

  init() {
    /// TODO: Currently hardcoded at 100. Would be nice to only init
    /// the number of rows needed. See `rows` inside of `GeometryReader`
    _quadrants = State(initialValue: (0..<100).map { _ in
      (0..<SwivelScreen.columns).map { _ in Quadrant.randomQuadrant() }
    })
  }

  // MARK: Internal

  @State var quadrants: [[Quadrant]] = []

  let id = UUID()
  var name = "Swivel"

  var body: some View {
    GeometryReader { proxy in

      let rows = Int(proxy.size.height / (proxy.size.width / columnFloat))
      let widthAndHeight = proxy.size.width / columnFloat

      Grid(horizontalSpacing: 0, verticalSpacing: 0) {
        Spacer()
        ForEach(0..<rows, id: \.self) { rowIndex in

          GridRow {
            ForEach(SwivelScreen.columnRange, id: \.self) { columnIndex in
              SwivelCircle(currentQuadrant: quadrants[rowIndex][columnIndex])
                .frame(
                  width: widthAndHeight,
                  height: widthAndHeight)
                .onTapGesture {
                  rotateQuadrant(rowIndex, columnIndex)
                  handleTapGesture(rowIndex, columnIndex)
                }
            }
          }
        }
        Spacer()
      }
    }
  }

  // MARK: Private

  private enum Direction: Int {
    case above = 1, below, left, right, topLeft, topRight, bottomLeft, bottomRight
  }

  private static let columns = 12
  private static let columnRange: Range<Int> = 0..<columns

  private let columnFloat = CGFloat(SwivelScreen.columns)

  private func rotateQuadrant(_ rowIndex: Int, _ columnIndex: Int) {
    switch quadrants[rowIndex][columnIndex] {
    case .SE:
      quadrants[rowIndex][columnIndex] = .SW
    case .SW:
      quadrants[rowIndex][columnIndex] = .NW
    case .NW:
      quadrants[rowIndex][columnIndex] = .NE
    case .NE:
      quadrants[rowIndex][columnIndex] = .SE
    }
  }

  private func isEastFacing(_ quadrant: Quadrant) -> Bool {
    quadrant == .NE || quadrant == .SE
  }

  private func isWestFacing(_ quadrant: Quadrant) -> Bool {
    quadrant == .NW || quadrant == .SW
  }

  private func isNorthFacing(_ quadrant: Quadrant) -> Bool {
    quadrant == .NW || quadrant == .NE
  }

  private func isSouthFacing(_ quadrant: Quadrant) -> Bool {
    quadrant == .SW || quadrant == .SE
  }

  private func handleTapGesture(_ rowIndex: Int, _ columnIndex: Int) {
    let surroundingOffsets = [
      (-1, 0, 1), (1, 0, 2), // above and below
      (0, -1, 3), (0, 1, 4), // left and right
      (-1, -1, 5), (-1, 1, 6), // top-left and top-right
      (1, -1, 7), (1, 1, 8), // bottom-left and bottom-right
    ]
    for offset in surroundingOffsets {
      let newRow = rowIndex + offset.0
      let newColumn = columnIndex + offset.1

      // Check if the new position is within bounds
      if
        newRow >= 0,
        newRow < quadrants.count,
        newColumn >= 0,
        newColumn < quadrants.first!.count
      {
        let adjacentQuadrant = quadrants[newRow][newColumn]
        let centerQuadrant = quadrants[rowIndex][columnIndex]
        let direction = Direction(rawValue: offset.2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
          switch centerQuadrant {
          case .SE:
            if direction == .below {
              if isNorthFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }
            if direction == .right {
              if isWestFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }

          case .SW:
            if direction == .below {
              if isNorthFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }
            if direction == .left {
              if isEastFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }

          case .NW:
            if direction == .above {
              if isSouthFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }
            if direction == .left {
              if isEastFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }

          case .NE:
            if direction == .above {
              if isSouthFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }
            if direction == .right {
              if isWestFacing(adjacentQuadrant) {
                rotateQuadrant(newRow, newColumn)
                handleTapGesture(newRow, newColumn)
              }
            }
          }
        }
      }
    }
  }
}

#Preview {
  SwivelScreen()
}
