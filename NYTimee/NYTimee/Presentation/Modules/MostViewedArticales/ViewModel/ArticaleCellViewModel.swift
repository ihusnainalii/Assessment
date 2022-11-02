//
//  ArticaleCellViewModel.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class ArticaleCellViewModel: BaseViewModel {
    
    // MARK: - Variables
    let articale = BehaviorRelay<Results?>(value: nil)
    
    // MARK: - Initialiser
    init(_ articale: Results) {
        self.articale.accept(articale)
    }
}
