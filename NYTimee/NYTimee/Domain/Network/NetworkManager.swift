//
//  NetworkManager.swift
//  Limou Cloud
//
//  Created by developer on 18/05/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import MobileCoreServices

// Network ErrorMessage
let GENERIC_ERROR_MESSAGE = "Please check your internet connection and try again the same request or hold a moment while we try to reconnect."

class NetworkManager: NSObject {
    
    // MARK: - Shared instance
    static let shared = NetworkManager()
    private let alamofireManager = AlamofireManager()
    
    // MARK: - Shared Variables
    let retryLimit = 3
    
    // MARK: - Constants

    // MARK: - Shared methods
    private func addAuthHeaders(_ isAuth: Bool = false, _ isJson: Bool = false) -> (Bool, HTTPHeaders) {
        var header: HTTPHeaders = [:]
        
        if isAuth {
            header[Utilities.Headers.auth] = ""
        }
        
        if isJson {
            header[Utilities.Headers.contentType] = Utilities.Headers.JsonEncoded
        } else {
            header[Utilities.Headers.contentType] = Utilities.Headers.FormUrlEncoded
        }
        
        return (true, header)
    }
    
    // MARK: - Request for General Apis
    func request(_ url: String, _ method: HTTPMethod = .get, _ params: Params, isAuthReq: Bool = false, isJosnEncoded: Bool = false, completion: @escaping CompletionNetwork) {
        let monitorNetwork = MonitorNetwork()
        // check if internet is connected
        monitorNetwork.Connection(observe: false) { connection in
            if let isConnected = connection, isConnected {
                self.alamofireManager.session.request(url, method: method, parameters: params, encoding: isJosnEncoded ? JSONEncoding.default : URLEncoding.default, headers: self.addAuthHeaders(isAuthReq, isJosnEncoded).1).validate(statusCode: 200..<600).responseJSON { (response) in
                    
                    switch response.result {
                    case .failure(let error):
                        
                        // Failure completion block
                        completion(.failure(.network(string: GENERIC_ERROR_MESSAGE + error.localizedDescription)))

                    case .success(let data):
                        
                        // Success block
                        let json = JSON(data)
                        if let statusCode = response.response?.statusCode, statusCode == 200 {
                            completion(.success(json))
                        } else {
                            completion(.failure(.custom(string: "Data not found")))
                        }
                    }
                }
            } else {
                // if internet is not available
                completion(.failure(.network(string: GENERIC_ERROR_MESSAGE)))
            }
        }
    }
}

extension Dictionary {
    var toJson: Data? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil
        }
        return theJSONData
    }
}
