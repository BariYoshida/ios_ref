//
//  APIResult.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation

enum APIResult<Success: Decodable>: Decodable {
    case success(Success)
    case failure(APIError)
}

extension APIResult {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = .success(try container.decode(Success.self))
        } catch DecodingError.typeMismatch {
            self = .failure(try container.decode(APIError.self))
        }
    }
}

//https://stackoverflow.com/questions/71898148/alamofire-responsedecodable-for-model-for-response-and-error
//https://stackoverflow.com/questions/58792754/swift-decodable-endpoint-returns-completely-different-types
