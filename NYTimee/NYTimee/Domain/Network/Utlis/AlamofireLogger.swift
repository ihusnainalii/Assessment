//
//  AlamofireLogger.swift
//  Renolit
//
//  Created by devadmin on 11/03/2022.
//

import Foundation
import Alamofire

struct AlamofireLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "BaseLogger")
    
    func requestDidResume(_ request: Request) {
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint(response)
    }
}
