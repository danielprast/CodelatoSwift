//
//  FileNameFactory.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation


public protocol FileNameFactory {
  func makeFileName(extensionType: FileExtensionType) -> String
}


public struct FileNameFactoryV1: FileNameFactory {
  
  public init() {}
  
  public func makeFileName(extensionType: FileExtensionType) -> String {
    
    let currentDate = Date()
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyyMMddHHmmss"
    
    //    let username = UserDefaultHelper.shared
    //      .string(of: .userName) ?? "John AppleSeed"
    let username = "username"
    
    let dateLabel = "\(dateFormat.string(from: currentDate))"
    
    return "PCC_\(username)_\(dateLabel).\(extensionType.stringValue)"
  }
  
}


public struct FileNameFactoryV2: FileNameFactory {
  
  public init() {}
  
  public func makeFileName(extensionType: FileExtensionType) -> String {
    
    let currentDate = Date()
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyyMMddHHmmss"
    
    let dateLabel = "\(dateFormat.string(from: currentDate))"
    
    return "PCC_contractor_\(dateLabel).\(extensionType.stringValue)"
  }
  
}
