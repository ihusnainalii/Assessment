//
//  APIURLs.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation

/// This struct is used to set url endpoints
struct EndPoints {
    
    // MARK: - Public variables
    var requestedURL: String?
    
    // MARK: - init
    init(with URI: String) {
        let configurators = AppConfiguration()
        requestedURL = configurators.apiBaseURL + URI
    }
}



struct APIURLs {
    
    // MARK: - Private variables

    // Authenticate
    static let fetchArticles = EndPoints(with: "mostpopular/v2/viewed/1.json?api-key=moqkS4Sxk6yR3Pa3JP99FPuKg5I7Sk2g").requestedURL
}


