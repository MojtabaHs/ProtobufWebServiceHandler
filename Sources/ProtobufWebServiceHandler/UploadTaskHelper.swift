//
//  UploadTaskHelper.swift
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 8/22/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import Foundation

public extension HTTPWebServiceHandler {
    func resumeUploadTask<T: Parsable, U: Parsable>(
        urlRequestable: URLRequestable,
        fileURL: URL,
        success: @escaping ((T?) -> Void),
        failure: @escaping (U?, Error?) -> Void) throws -> URLSessionUploadTask {
        let data = try Data(contentsOf: fileURL)
        return try resumeUploadTask(urlRequestable: urlRequestable, bodyData: data, success: success, failure: failure)
    }
}
