//
//  DevelopmentMode.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation


public class DevelopmentMode {
  
  public static let shared = DevelopmentMode()
  
  private init() {}
  
  public private(set) var isActive: Bool = false
  
  public func activateDevelopmentMode() {
    isActive = true
  }
  
  public func deactivateDevelopmentMode() {
    isActive = false
  }
  
}
