//
//  NewsCell.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "NewsCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    // MARK: - Variables
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
                articleImage.setImage(url)
            }
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
}
