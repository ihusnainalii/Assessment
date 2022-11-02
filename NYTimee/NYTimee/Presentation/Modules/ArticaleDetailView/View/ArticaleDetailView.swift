//
//  ArticaleDetailView.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import UIKit

class ArticaleDetailView: UIViewController {
    
    // MARK: - IbOutlets
    @IBOutlet weak var articleBaseImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    // MARK: - varibles
    var articleCellVM: ArticaleCellViewModel? {
        didSet {
            guard let articleCellVM = articleCellVM else {
                return
            }
            titleLbl?.text = articleCellVM.articale.value?.title ?? ""
            descriptionLbl?.text = articleCellVM.articale.value?.abstract ?? ""
            dateLbl?.text = articleCellVM.articale.value?.publishedDate ?? ""
            sourceLbl?.text = articleCellVM.articale.value?.byline ?? ""
            if let media = articleCellVM.articale.value?.media?.first {
                let url = media.metadata?.first?.url ?? ""
                articleBaseImage?.setImage(url)
            }
        }
    }
    
    // MARK: - vieew life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Details"
    }

}
