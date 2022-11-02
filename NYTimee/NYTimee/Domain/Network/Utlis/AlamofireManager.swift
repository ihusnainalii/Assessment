//
//  AlamofireManager.swift
//  Renolit
//
//  Created by devadmin on 11/03/2022.
//

import Foundation
import Alamofire

struct AlamofireManager {
    
    // MARK: - interceptors
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    
    // MARK: - logger
    let monitors = [AlamofireLogger()] as [EventMonitor]
    
    // MARK: - session
    var session = Session()
    
    init() {
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors
        )
    }
}
