//
//  IconLabelView.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/8.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

class IconLabelView: FDXibBaseView {
    
    @IBOutlet weak fileprivate var titleLabel: UILabel!
    @IBOutlet weak fileprivate var imageView: UIImageView!
    
}

// MARK: - config
extension IconLabelView {
    public func configUI(image: UIImage ,title: String) {
        titleLabel.text = title
        imageView.image = image
    }
}
