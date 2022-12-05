//
//  RESTClient.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation
import Alamofire
import Combine

class RESTClient {
    func execute <Response: Decodable> (url: String, method: HTTPMethod, parameters: [String : Any]?, httpHeaders: HTTPHeaders? = nil) -> AnyPublisher<Response, AFError> {
        let isGetMethod = method == .get
        let encoding: ParameterEncoding = isGetMethod ? URLEncoding.default : JSONEncoding.default
        
        
        let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: httpHeaders)
        
        return request.validate()
            .response(completionHandler: { data in
                print(data)
            })
            .responseJSON { (responseAny: AFDataResponse<Any>) in
                if let response = responseAny as? AFDataResponse<Response> {
                    self.handleResponseError(response)
                }
            }
            .publishDecodable(type: Response.self, emptyResponseCodes: [200, 201])
            .value()
            .eraseToAnyPublisher()
    }
    
    func handleResponseError<Response: Decodable>(_ response: AFDataResponse<Response>) {
        
    }
}
