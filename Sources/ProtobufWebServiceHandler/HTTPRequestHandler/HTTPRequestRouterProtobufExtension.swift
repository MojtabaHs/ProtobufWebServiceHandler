//
//  HTTPRequestRouterProtobufExtension.swift
//  ProtobufWebServiceHandler
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 5/19/20.
//  
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation
import SwiftProtobuf

public typealias Nothing = String

public extension HTTPRequestRouter where Self: Message {

    var httpMethod: String { "POST" }
    var urlParameters: Nothing? { nil }

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
        let request: URLRequest = try {
            var request = URLRequest(url: urlComponents.url ?? url)
            request.httpMethod = httpMethod
            request.httpBody = try serializedData()
            return request
        }()

        return request
    }
}
