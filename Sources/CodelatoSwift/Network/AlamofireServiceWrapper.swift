//
//  AlamofireServiceWrapper.swift
//  Created by Daniel Prastiwa on 05/12/22.
//

import Foundation
import Alamofire


open class AlamofireServiceWrapper {
  
  public let alamofireService: Alamofire.Session
  
  public init(alamofireService: Alamofire.Session = .default) {
    self.alamofireService = alamofireService
  }
  
  // MARK: - ⌘ GET Requests
  
  open func makeGetRequest<T: Codable>(
    resource: NetworkServiceResource<T>,
    completion: @escaping(Swift.Result<T, NError>) -> Void
  ) {
    let headers = resource.headers
      .map { (key, value) in
        Alamofire.HTTPHeader(name: key, value: value)
      }
    
    alamofireService.request(
      resource.url,
      method: .get,
      parameters: resource.parameters,
      encoding: URLEncoding.default,
      headers: Alamofire.HTTPHeaders(headers)
    )
    .validate()
    .responseData { [weak self] (responseData) in
      guard let self = self else { return }
      switch self.validate(responseData: responseData) {
      case .success(let data):
        guard let dataModel: T = JsonResolver.decodeJson(from: data, outputType: T.self)
        else {
          completion(.failure(.parsingError))
          return
        }
        completion(.success(dataModel))
        break
      case .failure(let err):
        completion(.failure(err))
        break
      }
    }
  }
  
  // MARK: - ⌘ POST Requests
  
  open func makePostRequest<T: Codable>(
    resource: NetworkServiceResource<T>,
    completion: @escaping(Swift.Result<T, NError>) -> Void
  ) {
    let headers = resource.headers
      .map { (key, value) in
        Alamofire.HTTPHeader(name: key, value: value)
      }
    
    alamofireService.request(
      resource.url,
      method: .post,
      parameters: resource.parameters,
      encoding: URLEncoding.default,
      headers: Alamofire.HTTPHeaders(headers)
    )
    .validate()
    .responseData { [weak self] (responseData) in
      guard let self = self else { return }
      switch self.validate(responseData: responseData) {
      case .success(let data):
        guard let dataModel: T = JsonResolver.decodeJson(from: data, outputType: T.self)
        else {
          completion(.failure(.parsingError))
          return
        }
        completion(.success(dataModel))
        break
      case .failure(let err):
        completion(.failure(err))
        break
      }
    }
  }
  
  // MARK: - ⌘
  
  open func inspectResponse(_ response: DataResponse<Data, AFError>) {
    shout("Begin network Request", value: "----------------------------------------")
    shout("headers", value: response.request?.allHTTPHeaderFields as Any)
    shout("url request", value: String(describing: response.request?.url))
#if DEBUG
    dump(response.request)
#endif
    //shout("http request body", value: response.request?.httpBody as Any)
    guard let data = response.data else {
      shout("response body", value: String(describing: response.data?.prettyPrintedJSONString ?? ""))
      return
    }
    //shout("response payload string", value: String(data: data, encoding: .utf8) as Any)
    shout("Response data", value: String(describing: data.prettyPrintedJSONString ?? ""))
    shout("End network Request", value: "----------------------------------------\n")
  }
  
  open func validate(responseData response: DataResponse<Data, AFError>) -> Swift.Result<Data, NError> {
    let errorMessage = "Maaf, sistem kami sedang mengalami gangguan. Silakan coba lagi nanti."
    let statusCode = response.response?.statusCode ?? 500
    let unknownError: NError = .custom(errorMessage)
    
    inspectResponse(response)
    
    if 200...299 ~= statusCode {
      guard let data = response.data else {
        return .failure(unknownError)
      }
      return .success(data)
    } else if statusCode == 400 {
      return parse400StatusCodeResponse(response.data)
    } else if statusCode == 401 {
      return .failure(.unauthorized)
    } else if statusCode == 404 {
      return .failure(.notFound)
    } else if statusCode == 500 {
      return .failure(.internalServerError)
    } else {
      return .failure(unknownError)
    }
  }
  
  open func parse400StatusCodeResponse(_ responseData: Data?) -> Swift.Result<Data, NError> {
    let iseError: NError = .internalServerError
    guard let data = responseData else {
      return .failure(iseError)
    }
    return .failure(.custom(parseErrorBody(data: data)))
  }
  
  public typealias ErrorMessage = String
  
  open func parseErrorBody(data: Data) -> ErrorMessage {
    shout("Error response", value: data.prettyPrintedJSONString ?? "")
    let defaultErrorMessage = "Ups! Something went wrong. Please try again."
    
    guard
      let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    else { return defaultErrorMessage }
    
    return jsonObject["message"] as? String ?? defaultErrorMessage
  }
}
