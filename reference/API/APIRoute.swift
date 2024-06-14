//
//  APIRoute.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Alamofire
import Foundation

enum APIRoute {

}

extension APIRoute {

    static func request<Body: Codable>(_ request: APIRequestable, body: Body.Type) async throws -> Body {

        let dataTask = AF.request(request)
            .validate(statusCode: 200 ..< 300)
            .serializingDecodable(Body.self)
        let response = await dataTask.response
        let result = await dataTask.result

        switch result {
        case .success(let value):
            return value

        case .failure(let error):
            //print(error, response.response?.url)

            guard let httpResponse = response.response else {
                throw APIErrorType.unknown("予期せぬエラー")
            }

            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                throw APIErrorType.decodeError
            }

            let decoder = JSONDecoder()
            guard let data = response.data else {
                throw APIErrorType.unknown("予期せぬエラー")
            }

            guard let customError = try? decoder.decode(APIError.self, from: data) else {
                throw APIErrorType.apiClientError
            }

            throw self.parseError(code: httpResponse.statusCode, customError)

        }

    }

    private static func parseError(code: Int, _ error: APIError) -> APIErrorType {
        switch code {
        case 400...499:
            return clientErrorHandler(code: code, error)
        case 500:
            return .serverError
        case 503:
            return .maintenance
        default:
            return .unknown("予期せぬエラー")
        }
    }

    private static func clientErrorHandler(code: Int, _ error: APIError) -> APIErrorType {
        switch code {
        case 401:
            return .errorResponse(error)
        case 426:
            return .forceUpdate(error)
        default:
            return .errorResponse(error)
        }
    }
}
