//
//  APIRequestable.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Alamofire
import Foundation
import KeychainAccess

protocol APIRequestable: URLRequestConvertible {

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var headers: HTTPHeaders { get }

}

extension APIRequestable {

    var baseURL: URL {
        return URL(string: APIConst.BASE_URL + APIConst.VERSION)!
    }

    var headers: HTTPHeaders {
     
        return [
            "Content-Type": "application/json",
            "Os-Type": "iOS",
            "App-Version": Self.appVersion(),
        ]
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let request = try URLRequest(url: url,
                                     method: method,
                                     headers: headers)

        let encording: ParameterEncoding = {
            switch method {
            case .post, .put, .patch:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()

        return try encording.encode(request, with: parameters)
    }
}

extension APIRequestable {

    static func appVersion() -> String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return ""
        }
        return version
    }

}

