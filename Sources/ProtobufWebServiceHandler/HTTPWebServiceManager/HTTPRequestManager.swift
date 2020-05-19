//
//  HTTPRequestManager.swift
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

open class HTTPRequestManager: HTTPRequestHandler {
    public init(urlSession: URLSession, urlRequestAdapters: [URLRequestAdapter] = []) {
        self.urlSession = urlSession
        self.urlRequestAdapters = urlRequestAdapters
    }
    
    open var urlSession: URLSession
    open var urlRequestAdapters: [URLRequestAdapter]
}

extension HTTPRequestManager {
    public static let `default` = HTTPRequestManager(urlSession: URLSession(configuration: .default))
}
