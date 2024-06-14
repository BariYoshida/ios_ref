//
//  UserAPIRequest.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Alamofire
import Foundation

struct UserAPIRequest: APIRequestable {

    var path: String

    var method: HTTPMethod

    var parameters: Parameters

    init(path: String, method: HTTPMethod, parameters: Parameters) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }
}
