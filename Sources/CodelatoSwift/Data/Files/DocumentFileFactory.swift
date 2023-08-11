//
//  DocumentFileFactory.swift
//  Created by Daniel Prastiwa on 24/01/23.
//

import Foundation
import Combine


public protocol DocumentFileFactory {
  
  func createDocument(
    from file: URL,
    fileName: String
  ) -> AnyPublisher<DocumentFileFactoryEntity, NError>
  
}

// MARK: - ⌘ Implementation -

public struct DocumentFileFactory_V1: DocumentFileFactory {
  
  public init() {}
  
  public func createDocument(
    from file: URL,
    fileName: String = "dokumen_pe_de_ef.pdf"
  ) -> AnyPublisher<DocumentFileFactoryEntity, NError> {
    let defaultErrorMessage = "Failed to create document"
    return Future<DocumentFileFactoryEntity, NError> { promise in
      do {
        let downloadedData = try Data(contentsOf: file)
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(
          .documentDirectory,
          .userDomainMask,
          true
        ).first! as NSString
        let destinationPath = documentDirectoryPath.appendingPathComponent(fileName)
        let pdfFileURL = URL(fileURLWithPath: destinationPath)
        
        FileManager.default.createFile(
          atPath: pdfFileURL.path,
          contents: downloadedData,
          attributes: nil
        )
        
        if FileManager.default.fileExists(atPath: pdfFileURL.path) {
          shout("file url result", value: pdfFileURL)
          let fileData = try? Data(contentsOf: pdfFileURL)
          let model = DocumentFileFactoryEntityModel(
            fileUrl: pdfFileURL,
            fileData: fileData
          )
          promise(.success(model))
          return
        }
        promise(.failure(.custom(defaultErrorMessage)))
      } catch {
        shout("failed to create document", value: error.localizedDescription)
        promise(.failure(.custom(defaultErrorMessage.appending(", \(error.localizedDescription)"))))
      }
    }.eraseToAnyPublisher()
  }
  
}


public protocol DocumentFileFactoryEntity: DataEntity {
  var fileUrl: URL? { get }
  var fileData: Data? { get }
}


public struct DocumentFileFactoryEntityModel: DocumentFileFactoryEntity {
  
  public var fileUrl: URL?
  public var fileData: Data?
  
  public init(fileUrl: URL? = nil, fileData: Data? = nil) {
    self.fileUrl = fileUrl
    self.fileData = fileData
  }
  
}
