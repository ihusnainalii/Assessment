//
//  AppConfiguration.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation

/// Configuration for base url and image url
final class AppConfiguration {
    
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
