//
//  BaseNavigationBar.swift
//  NYTimee
//
//  Created by devadmin on 02/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class BaseNavigationBar: UIViewController {
    
    // MARK: - varibles
    let disposeBag = DisposeBag()
    let menuBtn = UIButton(type: .system)
    let searchBtn = UIButton(type: .system)
    let settingsBtn = UIButton(type: .system)
    
    lazy var LeftBarItems: Array = { () -> [UIBarButtonItem] in
        menuBtn.setImage(UIImage(named: "menu"), for: .normal)
        menuBtn.imageView?.contentMode = .scaleAspectFit
        menuBtn.tintColor = .white
        menuBtn.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        menuBtn.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        menuBtn.applyNavBarConstraints(size: (width: 30, height: 30))
        
        // Create Custom View
        let mbarButton = UIBarButtonItem(customView: menuBtn)
        return [mbarButton]
    }()
    
    lazy var RightBarItems: Array = { () -> [UIBarButtonItem] in
        
        searchBtn.setImage(UIImage(named: "search"), for: .normal)
        searchBtn.imageView?.contentMode = .scaleAspectFit
        searchBtn.tintColor = .white
        searchBtn.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchBtn.applyNavBarConstraints(size: (width: 30, height: 30))
        
        // Create Custom View
        let searchbarButton = UIBarButtonItem(customView: searchBtn)
        
        settingsBtn.setImage(UIImage(named: "options"), for: .normal)
        settingsBtn.imageView?.contentMode = .scaleAspectFit
        settingsBtn.tintColor = .white
        settingsBtn.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        settingsBtn.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        settingsBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        settingsBtn.applyNavBarConstraints(size: (width: 30, height: 30))
        
        // Create Custom View
        let sbarButton = UIBarButtonItem(customView: settingsBtn)
        return [sbarButton, searchbarButton]
    }()
    
    
    // MARK: - vieew life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        /// navigation
        self.navigationItem.setLeftBarButtonItems(self.LeftBarItems, animated: true)
        self.navigationItem.setRightBarButtonItems(self.RightBarItems, animated: true)
        setupNavigation()
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    
    func setupNavigation() {
        // Navigation Settings
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "NavBarColor")
        appearance.shadowColor = UIColor(named: "NavBarColor")
        
        let font = UIFont(name: "Avenir-Medium", size: 16) ?? .systemFont(ofSize: 16)
        let titleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        appearance.titleTextAttributes = titleAttribute
        
        // Set Navigation Appearance
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance  = appearance
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarColor")
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    @objc func menuTapped() {
        print("Menu Tapped")
    }
    
    @objc func searchTapped() {
        print("Search Tapped")
    }
    
    @objc func settingsTapped() {
        print("Settings Tapped")
    }
}

extension UIView {
    func applyNavBarConstraints(size: (width: CGFloat, height: CGFloat)) {
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: size.width)
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: size.height)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
}
