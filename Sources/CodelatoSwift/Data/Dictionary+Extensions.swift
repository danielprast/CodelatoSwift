//
//  Dictionary+Extensions.swift
//  Created by Daniel Prastiwa on 07/01/23.
//

import Foundation


extension Dictionary {
  
  public func toJsonStringUTF8Encoded() -> String {
    if isEmpty {
      return "{}"
    }
    
    let jsonData = try! JSONSerialization.data(
      withJSONObject: self,
      options: []
    )
    
    return String(data: jsonData, encoding: .utf8) ?? "{}"
  }
  
}
