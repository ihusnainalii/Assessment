//
//  TableView+Extension.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func confirmDelegate(delegate: UITableViewDelegate, isEnableSeparator: Bool = false) {
        self.delegate = delegate
        self.separatorStyle = isEnableSeparator ? .singleLine : .none
        self.separatorColor = isEnableSeparator ? .lightText : .clear
        self.tableFooterView = UIView(frame: .zero)
        self.backgroundColor = .clear
    }
    
    func register(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
