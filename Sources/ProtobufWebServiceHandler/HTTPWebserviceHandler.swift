//
//  HTTPWebServiceHandler.swift
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 5/15/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public protocol HTTPWebServiceHandler {
    var requestHandler: HTTPRequestHandler { get }
    var responseHandler: HTTPResponseHandler { get }
    
    func resumeDataTask<T: Parsable, U: Parsable>(
        urlRequestable: URLRequestable,
        success: @escaping ((T?) -> Void),
        failure: @escaping (U?, Error?) -> Void) throws -> URLSessionDataTask

    func resumeUploadTask<T: Parsable, U: Parsable>(
        urlRequestable: URLRequestable,
        bodyData: Data?,
        success: @escaping ((T?) -> Void),
        failure: @escaping (U?, Error?) -> Void) throws -> URLSessionDataTask
}

public extension HTTPWebServiceHandler {
    func resumeDataTask<T: Parsable, U: Parsable>(
        urlRequestable: URLRequestable,
        success: @escaping ((T?) -> Void) = { _ in },
        failure: @escaping (U?, Error?) -> Void = { _, _ in }) throws -> URLSessionDataTask {
        
        try requestHandler.resumeDataTask(
            urlRequestable: urlRequestable,
            completionHandler: { (data, response, error) in
                self.responseHandler.handleResponse(data: data, response: response, error: error, success: success, failure: failure)
        })
    }

    func resumeUploadTask<T: Parsable, U: Parsable>(
        urlRequestable: URLRequestable,
        bodyData: Data?,
        success: @escaping ((T?) -> Void) = { _ in },
        failure: @escaping (U?, Error?) -> Void = { _, _ in }) throws -> URLSessionDataTask {

        try requestHandler.resumeUploadTask(
            urlRequestable: urlRequestable,
            bodyData: bodyData,
            completionHandler: { (data, response, error) in
                self.responseHandler.handleResponse(data: data, response: response, error: error, success: success, failure: failure)
            })
    }
}
