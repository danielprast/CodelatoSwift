//
//  NetworkServiceResource.swift
//  Created by Daniel Prastiwa on 05/12/22.
//

import Foundation


public typealias HTTPHeaders = [String: String]


public struct NetworkServiceResource<T: Codable> {
  
  public let url: URL
  public var parameters: [String: Any]
  public var headers: HTTPHeaders
  public var encoding: String
  public var httpMethod: HTTPMethod
  
  public init(
    url: URL,
    params: [String: Any] = [:],
    headers: HTTPHeaders = [:],
    encoding: String = "",
    httpMethod: HTTPMethod = .get
  ) {
    self.url = url
    self.parameters = params
    self.headers = headers
    self.encoding = encoding
    self.httpMethod = httpMethod
  }
  
}


public enum HTTPMethod: String {
  case options = "OPTIONS"
  case get     = "GET"
  case head    = "HEAD"
  case post    = "POST"
  case put     = "PUT"
  case patch   = "PATCH"
  case delete  = "DELETE"
  case trace   = "TRACE"
  case connect = "CONNECT"
}
