//
//  CompanyResponse.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation

struct CompanyResponses: Codable {
    let data: [CompanyResponse]
}

struct CompanyResponse: Codable {
    let title: String
    let location: String
    let lookingFor: String
    let image: Image
    let company: Company
    let staffingsCount: Int
    private enum CodingKeys: String, CodingKey {
        case title
        case location
        case lookingFor = "looking_for"
        case image
        case company
        case staffingsCount = "staffings_count"
    }
    
    struct Company: Codable {
        let name: String
    }
    
    struct Image: Codable {
        let original: String
    }
}
