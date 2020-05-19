//
//  HTTPRequestRouter.swift
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

public protocol URLRequestable {
    func urlRequest() throws -> URLRequest
}

public protocol HTTPRequestRouter: URLRequestable {
    associatedtype URLParameters: Encodable
    associatedtype Result: Parsable
    
    var path: String { get }
    var urlParametersEncoder: JSONEncoder { get }
    var urlParameters: URLParameters? { get }
    var baseURL: URL { get }

    var httpMethod: String { get }
}

public extension HTTPRequestRouter {
    func urlRequest() throws -> URLRequest {

        let url = baseURL.appendingPathComponent(path)

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            assertionFailure("Invalid URL")
            return URLRequest(url: url)
        }
        if let urlParameters = urlParameters {
            urlComponents.queryItems = try urlParametersEncoder.urlQueryItems(encodable: urlParameters)
        } else {
            // TODO: this should handle better
        }

        return URLRequest(url: urlComponents.url ?? url)
    }
}
