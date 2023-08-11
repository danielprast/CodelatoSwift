//
//  AppConfigForTesting.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation


public struct AppConfigForTesting {
  
  public static var isXCTest: Bool {
    ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }
  
  public static var isPreviews: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
  }
  
  public static var isTestOrPreviews: Bool {
    var isDebug = false
    #if DEBUG
    isDebug = isXCTest || isPreviews
    #endif
    return isDebug
  }
  
}
