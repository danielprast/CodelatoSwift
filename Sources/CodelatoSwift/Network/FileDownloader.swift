//
//  FileDownloader.swift
//  Created by Daniel Prastiwa on 17/02/23.
//

import Foundation


public protocol FileDownloaderDelegate: AnyObject {
  func fileDownloader(didFinishDownloadingTo location: URL)
  func invalidUrl(error: NError ,for url: URL?)
}


open class FileDownloader: NSObject, URLSessionDownloadDelegate {
  
  public weak var delegate: FileDownloaderDelegate?
  
  public override init() {}
  
  open lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    return URLSession(
      configuration: configuration,
      delegate: self,
      delegateQueue: OperationQueue()
    )
  }()
  
  open func downloadFile(for url: URL?) {
    guard let url = url else {
      let error = NError.invalidUrl(url?.absoluteString ?? "invalid url")
      delegate?.invalidUrl(error: error, for: url)
      return
    }
    session.downloadTask(with: url)
      .resume()
  }
  
  // MARK: - ⌘ URLSessionDownload Delegate
  
  public func urlSession(
    _ session: URLSession,
    downloadTask: URLSessionDownloadTask,
    didFinishDownloadingTo location: URL
  ) {
    delegate?.fileDownloader(didFinishDownloadingTo: location)
  }
  
  
  public func urlSession(
    _ session: URLSession,
    downloadTask: URLSessionDownloadTask,
    didWriteData bytesWritten: Int64,
    totalBytesWritten: Int64,
    totalBytesExpectedToWrite: Int64
  ) {}
  
}
