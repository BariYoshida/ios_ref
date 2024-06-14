//
//  APIConst.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation

struct APIConst {

    #if DEVELOPMENT
    static let BASE_URL = ""
    #elseif STAGING
    static let BASE_URL = ""
    #else
    static let BASE_URL = ""
    #endif

    static let VERSION = "/api/v1"

    static let USER = "/user"
}
