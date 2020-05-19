//
//  Parser.swift
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
import SwiftProtobuf

// TODO: Make it more abstract. This should not depend on `Message` or `Decodable` or etc.
public typealias Parsable = Message 

public protocol Parser {
    func parseData<T: Parsable>(_ data: Data, to: T.Type) throws -> T
}

// TODO: This should go to `ProtobufParser` some how
public extension Parser {
    func parseData<T: Parsable>(_ data: Data, to: T.Type) throws -> T { try T.init(serializedData: data)}
}
