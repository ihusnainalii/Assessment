//
//  EndPointEnum.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import Alamofire

/// Intercerptor for  HTTP requests
enum EndPointEnum {
    
    // user basic auth and profile
    case fetchArticles
}

/// defining end point types
extension EndPointEnum: EndPointType {
    
    var isAuthRequired: Bool {
        switch self {
        case .fetchArticles:
            return true
        }
    }
    
    var isJSONEncoded: Bool {
        switch self {
        case .fetchArticles:
            return false
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        // Post Method
        case .fetchArticles:
            return .get
        }
    }
    
    var url: String? {
        switch self {
        // User Repository
        case .fetchArticles:
            return APIURLs.fetchArticles
        }
    }
}
