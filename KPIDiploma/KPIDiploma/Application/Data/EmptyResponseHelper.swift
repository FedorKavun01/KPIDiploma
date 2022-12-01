//
//  EmptyResponseHelper.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 01.12.2022.
//

import Foundation
import Alamofire

struct EmptyResponseHelper: Decodable, EmptyResponse {
    static func emptyValue() -> EmptyResponseHelper {
        EmptyResponseHelper()
    }
}
