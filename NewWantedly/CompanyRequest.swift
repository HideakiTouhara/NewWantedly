//
//  CompanyRequest.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation
import APIKit

class JSONDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}

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
    typealias Response = CompanyResponses
    var query: String
    
    init(query: String) {
        self.query = query
    }
    
    var queryParameters: [String : Any]? {
        return [
            "q": query as AnyObject,
        ]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/api/v1/projects"
    }
    
    var dataParser: DataParser {
        return JSONDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> CompanyResponses {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(CompanyResponses.self, from: data)
    }
}
