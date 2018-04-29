//
//  CompanyRequest.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation
import APIKit

protocol CompanyRequestType : Request {
    
}

extension CompanyRequestType {
    var baseURL:URL {
        return URL(string: "https://www.wantedly.com")!
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
        return object
    }
}

struct CompanyRequest: CompanyRequestType {
    typealias Response = CompanyResponse
    var query: String
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/api/v1"
    }
    
    init(query: String) {
        self.query = query
    }
    
    var parameters: [String: AnyObject] {
        return [
            "projetcts": query as AnyObject,
        ]
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> CompanyResponse {
        guard let dictionary = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(CompanyResponse.self, from: dictionary)
    }
}
