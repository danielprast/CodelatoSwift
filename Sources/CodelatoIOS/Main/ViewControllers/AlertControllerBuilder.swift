//
//  AlertControllerBuilder.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


public class AlertControllerBuilder {
  
  public let alertController: UIAlertController
  
  public init(title: String, message: String) {
    alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
  }
  
  public func addAction(
    title: String,
    style: UIAlertAction.Style = .default,
    action: @escaping () -> Void
  ) -> Self {
    alertController.addAction(
      UIAlertAction(
        title: title,
        style: style
      ) { _ in action() }
    )
    return self
  }
  
  public func build() -> UIAlertController {
    return self.alertController
  }
  
}
