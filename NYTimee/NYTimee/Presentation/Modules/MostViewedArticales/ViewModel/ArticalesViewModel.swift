//
//  ArticalesViewModel.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class ArticalesViewModel: BaseViewModel {
    
    // MARK: - Variables
    var repository: NewsRepository?
    let articales = BehaviorRelay<[ArticaleCellViewModel]>(value: [])
    
    // MARK: - Initialiser
    init(_ repository: NewsRepository) {
        self.repository = repository
    }
    
    func fetchArticales() {
        
        // Add Loader
        self.isLoading.accept(true)
        
        // Request
        repository?.get(.fetchArticles, completion: { result in
            // Remove Loader
            self.isLoading.accept(false)
            
            // Response handling
            switch result {
            case .success(let metaData):
                if let metaDataResponse = metaData as? NyTimeResponse {
                    var articles = metaDataResponse.results ?? []
                    articles = articles.sorted(by: { ($0.publishedDate ?? "") > ($1.publishedDate ?? "")})
                    self.articales.accept(self.getCellViewModelWith(articles))
                }
                self.type.accept(.fetchArticles)
                self.isSuccess.accept(true)
            case .failure(let error):
                print("Parser error \(error)")
                self.setError(error.localizedDescription)
            }
        })
    }
    
    func  getCellViewModelWith(_ articles: [Results]) -> [ArticaleCellViewModel] {
        var articalCellVMList: [ArticaleCellViewModel] = []
        for article in articles {
            let articleCellViewModel = ArticaleCellViewModel(article)
            articalCellVMList.append(articleCellViewModel)
        }
        return articalCellVMList
    }
}
