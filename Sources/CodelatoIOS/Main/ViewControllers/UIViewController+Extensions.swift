//
//  UIViewController+Extensions.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


extension UIViewController {
  
  public func embedViewController(
    _ child: UIViewController,
    to parentView: UIView? = nil
  ) {
    if let parentView = parentView {
      child.view.frame = parentView.bounds
      parentView.addSubview(child.view)
    } else {
      view.addSubview(child.view)
    }
    
    addChild(child)
    child.didMove(toParent: self)
  }
  
  public func removeEmbedded(childViewController child: UIViewController?) {
    guard let child = child else {
      return
    }
    
    guard child.parent != nil else {
      return
    }
    
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
  
  // MARK: - ⌘ View Controller Dimensions
  
  public var navBarHeight: CGFloat {
    return navigationController?.navigationBar.frame.height ?? 44.0
  }
  
  public var statusBarHeight: CGFloat {
    let window = UIApplication.shared.windows.first
    return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
  }
  
  public var safeAreaInsets: UIEdgeInsets {
    let window = UIApplication.shared.windows.first
    return window?.safeAreaInsets ?? .zero
  }
  
  // MARK: - ⌘ Forms
  
  public func dismissSoftKeyboard() {
    view.endEditing(true)
  }
  
}

// MARK: - ⌘ UINavigationController Stuff

extension UINavigationController {
  
  public func setupTransparentStyleNavigationBar() {
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.barTintColor = .clear
    navigationBar.isTranslucent = true
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    view.backgroundColor = .clear
  }
  
}
