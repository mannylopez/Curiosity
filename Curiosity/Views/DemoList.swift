// Created by manny_lopez on 8/8/24.

import SwiftUI

// MARK: - ListView

struct DemoList: View {
  private let demos = DemosModel().demos
  var body: some View {
    NavigationView {
      List(demos, id: \.id) { demo in
        NavigationLink(demo.name, destination: demo.navigationBarBackButtonHidden())
      }
      .navigationTitle("Demos")
    }
  }
}

#Preview {
  DemoList()
}

// MARK: - UINavigationController + UIGestureRecognizerDelegate

extension UINavigationController: UIGestureRecognizerDelegate {

  // MARK: Open

  override open func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = self
  }

  // MARK: Public

  public func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
    viewControllers.count > 1
  }
}
