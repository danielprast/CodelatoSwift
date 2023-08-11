//
//  JsonResolver.swift
//  Created by Daniel Prastiwa on 05/12/22.
//

import Foundation


public struct JsonResolver {
  
  public init() {}
  
  public static func decodeJson<T>(
    from data: Data,
    outputType type: T.Type
  ) -> T? where T: Decodable, T: Encodable  {
    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      return nil
    }
  }
  
  public static func encodeToJson(dictionary: [String: Any]) -> String {
    guard
      let jsonData = try? JSONSerialization.data(
        withJSONObject: dictionary,
        options: .prettyPrinted
      ),
      let jsonString = String(data: jsonData, encoding: .utf8)
    else {
      return ""
    }
    return jsonString
  }
  
  public static func readJsonFileFromResource(
    bundle: Bundle,
    fileName: String
  ) -> Data? {
    guard
      let jsonResource = bundle.url(forResource: fileName, withExtension: "json"),
      let jsonData = try? Data(contentsOf: jsonResource)
    else {
      return nil
    }
    return jsonData
  }
  
}
