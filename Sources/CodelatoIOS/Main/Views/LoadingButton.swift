//
//  LoadingButton.swift
//  Created by Daniel Prastiwa on 07/01/23.
//

import Foundation
import UIKit
import LBTATools


open class LoadingButton: UIButton {
  
  public init() {
    super.init(frame: .zero)
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open var originalButtonText: String?
  
  open var activityIndicator: UIActivityIndicatorView!
  
  open func showLoading() {
    isEnabled = false
    originalButtonText = self.titleLabel?.text
    self.setTitle("", for: .normal)
    
    if (activityIndicator == nil) {
      activityIndicator = createActivityIndicator()
    }
    
    showSpinning()
  }
  
  open func hideLoading() {
    if activityIndicator == nil {
      return
    }
    isEnabled = true
    self.setTitle(originalButtonText, for: .normal)
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
  }
  
  open func createActivityIndicator() -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.hidesWhenStopped = true
    activityIndicator.color = .lightGray
    return activityIndicator
  }
  
  open func showSpinning() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(activityIndicator)
    centerActivityIndicatorInButton()
    activityIndicator.startAnimating()
  }
  
  open func centerActivityIndicatorInButton() {
    guard let superview = self.superview else { return }
    activityIndicator.centerXTo(superview.centerXAnchor)
    activityIndicator.centerYTo(superview.centerYAnchor)
  }
}
