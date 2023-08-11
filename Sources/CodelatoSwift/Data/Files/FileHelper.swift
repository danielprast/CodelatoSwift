//
//  FileHelper.swift
//  Created by Daniel Prastiwa on 24/01/23.
//

import Foundation


public struct FileHelper {
  
  public init() {}
  
  public static func getFileSizeInMB(fromUrl url: URL?) -> Double {
    guard let _ = url?.path else {
      return 0.0
    }
    
    do {
      let resources = try url?.resourceValues(forKeys:[.fileSizeKey])
      let fileSize = resources?.fileSize ?? 0
      return Double(fileSize)
    } catch {
      shout("Failed to get file size", value: "Error: \(error)")
    }
    
    return 0.0
  }
  
}
