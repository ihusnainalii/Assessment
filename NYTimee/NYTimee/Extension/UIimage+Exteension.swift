//
//  UIimage+Exteension.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.3 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
    
    func setImage(_ url: String) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), placeholder: Utilities.Assets.PLACE_HOLDER)
    }
    
    func ofColor(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
