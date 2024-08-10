// Created by manny_lopez on 8/9/24.

import SwiftUI

struct Swivel: View, Identifiable {
  let id = UUID()
  let name = "Initial"

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  Swivel()
}
