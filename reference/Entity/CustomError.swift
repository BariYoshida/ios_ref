//
//  CustomError.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation

struct APIError: Codable, Error {
    let title: String
    let message: String
    let errors: [ErrorDetail]?
}

struct ErrorDetail: Codable {
    let field: String
    let messages: [String]
}

enum APIErrorType: Error {
    case errorResponse(APIError)   // 401, 404, 409, 422, 428
    case forceUpdate(APIError)     // 426
    case serverError               // 500
    case maintenance               // 503

    case apiClientError

    case decodeError
    case unknown(String)
}
