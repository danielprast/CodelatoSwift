//
//  String+Extensions.swift
//  Created by Daniel Prastiwa on 07/01/23.
//

import Foundation
import UIKit


extension String {
  
  public func getHeight(
    withConstrainedWidth width: CGFloat,
    font: UIFont
  ) -> CGFloat {
    let constraintRect = CGSize(
      width: width,
      height: .greatestFiniteMagnitude
    )
    
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      attributes: [NSAttributedString.Key.font: font],
      context: nil
    )
    
    return ceil(boundingBox.height)
  }
  
  public func getWidth(
    withConstrainedHeight height: CGFloat,
    font: UIFont
  ) -> CGFloat {
    let constraintRect = CGSize(
      width: .greatestFiniteMagnitude,
      height: height
    )
    
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      attributes: [NSAttributedString.Key.font: font],
      context: nil
    )
    
    return ceil(boundingBox.width)
  }
  
}
