//
//  ArticalesViewController+TableExtension.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

extension ArticalesViewController: UITableViewDelegate {
    func bindTableView() {
        viewModel.articales.bind(to: tableView.rx.items(cellIdentifier: NewsCell.identifier)) { tableView, articale, cell in
            if let cell = cell as? NewsCell {
                cell.articleCellVM = articale
            }
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let articale = viewModel.articales.value[indexPath.row]
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "ArticaleDetailView") as? ArticaleDetailView {
            view.articleCellVM = articale
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
