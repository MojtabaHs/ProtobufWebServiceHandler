//
//  JSONParser.swift
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

public protocol ProtobufParser: Parser { }

public extension ProtobufParser {
    func parseData<T: Parsable>(_ data: Data, to: T.Type) throws -> T {
        print(T.self)
        print(T.Type.self)
        return try T.init(serializedData: data)

    }
}
