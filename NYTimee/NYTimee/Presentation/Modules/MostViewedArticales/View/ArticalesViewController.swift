//
//  ArticalesViewController.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ArticalesViewController: BaseNavigationBar {

    // MARK: - IbOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - varibles
    
    lazy var viewModel: ArticalesViewModel = {
        let viewModel = ArticalesViewModel(NewsRepository())
        return viewModel
    }()
    
    // MARK: - vieew life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        /// navigation title
        self.title = Utilities.Constants.kNewsTitleString
        
        /// Bind TableView
        bindTableView()
        tableView.register(NewsCell.identifier)
        tableView.confirmDelegate(delegate: self)
        
        /// Subscribe Reply
        subscribeRelay()
        configureServiceCallBacks()
        
        /// Feetch data
        viewModel.fetchArticales()
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    private func subscribeRelay() {
        viewModel.articales.observe(on: MainScheduler.instance).subscribe(
            onNext: { data in
                print(data)
            }
        ).disposed(by: disposeBag)
    }
    
    /// Displays HUD from API called to main View , a succes observable  for API here we perform action based on success/failure
    /// Message from response or set in viewModel
    private func configureServiceCallBacks() {
        
        // loading
        viewModel.isLoading
            .bind(to: self.view.rx.isShowHUD)
            .disposed(by: disposeBag)
        
        viewModel.message.drive(onNext: {(_message) in
            if let message = _message {
                print(message)
            }
        }).disposed(by: disposeBag)
    }
}



