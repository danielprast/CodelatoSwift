//
//  Data+Extensions.swift
//  Created by Daniel Prastiwa on 05/12/22.
//

import Foundation


extension Data {
  
  public var prettyPrintedJSONString: NSString? {
    guard
      let object = try? JSONSerialization.jsonObject(with: self, options: []),
      let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
      let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    else {
      return nil
    }
    return prettyPrintedString
  }
  
}
