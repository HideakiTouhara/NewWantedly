//
//  CompanyResponse.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation

struct CompanyResponse: Codable {
    let resData: [ResData]
    struct ResData: Codable {
        let title: String
        let image: [String]
        let location: String
        let lookingFor: String
        let company: Company
        let staffingsCount: String
        private enum CodingKeys: String, CodingKey {
            case title
            case image
            case location
            case lookingFor = "looking_for"
            case company
            case staffingsCount = "staffings_count"
        }
    }
    struct Company: Codable {
        let name: String
    }
}
