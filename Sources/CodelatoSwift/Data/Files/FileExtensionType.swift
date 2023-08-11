//
//  FileExtensionType.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation


public enum FileExtensionType {
  
  case jpg
  case jpeg
  case png
  case pdf
  case custom(String)
  
  public var stringValue: String {
    var result = ""
    
    switch self {
    case .jpg:
      result = "jpg"
    case .jpeg:
      result = "jpeg"
    case .png:
      result = "png"
    case .pdf:
      result = "pdf"
    case .custom(let extensionType):
      result = extensionType
    }
    
    return result
  }
  
}
