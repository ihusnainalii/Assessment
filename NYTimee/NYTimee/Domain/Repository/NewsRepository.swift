//
//  NewsRepository.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation

final class NewsRepository {
    
    
    /// GET function for generic api calls
    /// - Parameter completion: A comletion handler for success,
    func get(_ endPoint: EndPointEnum, _ params: Params = [:], completion: @escaping GenericModelCompletion<Any>) {
        
        // Check if url is not nil
        guard var requestedURL = endPoint.url else {
            return completion(.failure(.custom(string: "URL is not valid")))
        }
        
        // Network request
        NetworkManager.shared.request(requestedURL, endPoint.httpMethod, params, isAuthReq: endPoint.isAuthRequired, isJosnEncoded: endPoint.isJSONEncoded) { result in
            switch result {
            case .success(let metaData) :
                if let rawData  = try? metaData.rawData() {
                    do {
                        let response = try JSONDecoder().decode(NyTimeResponse.self, from: rawData)
                        completion(.success(response))
                    } catch {
                        completion(.failure(.parser(string: "Error While parsing")))
                    }
                } else {
                    completion(.failure(.parser(string: "Error No Data found")))
                }
            case .failure(let error) :
                print("error \(error)")
                completion(.failure(error))
            }
            
        }
    }
}
