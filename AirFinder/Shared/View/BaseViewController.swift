//
//  BaseViewController.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    private var titleLabel: UILabel?
    internal var subtitle: String? {
        didSet {
            subtitleSet()
        }
    }
    
    override var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
}

// MARK: - Private Methods
private extension BaseViewController {
    
    func subtitleSet() {
        titleLabel = UILabel()
        guard let titleLabel = titleLabel else {
            return
        }
        titleLabel.text = title
        let foregroundColor = navigationController?.navigationBar.titleTextAttributes?[.foregroundColor]
        let foregroundFont = navigationController?.navigationBar.titleTextAttributes?[.font]
        
        titleLabel.font = foregroundFont as? UIFont
        titleLabel.sizeToFit()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = foregroundColor as? UIColor
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subtitle
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleLabel.textAlignment = .center
        subTitleLabel.sizeToFit()
        subTitleLabel.textColor = UIColor.gray
        subTitleLabel.text = subtitle
        
        let arrangedSubiews = subtitle == nil ? [titleLabel] : [titleLabel, subTitleLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubiews)
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        
        let width = max(titleLabel.frame.size.width, subTitleLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        titleLabel.sizeToFit()
        subTitleLabel.sizeToFit()
        navigationItem.titleView = stackView
    }
}
