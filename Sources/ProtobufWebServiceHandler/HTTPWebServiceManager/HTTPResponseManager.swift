//
//  HTTPResponseManager.swift
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

open class HTTPResponseManager: HTTPResponseHandler {
    public init(parser: Parser, responseAdapters: [ResponseAdapter] = []) {
        self.parser = parser
        self.responseAdapters = responseAdapters
    }
    
    open var parser: Parser
    open var responseAdapters: [ResponseAdapter]
}

public extension HTTPResponseManager {
    static let `default` = HTTPResponseManager(parser: ProtobufParsingManager.default)
}
