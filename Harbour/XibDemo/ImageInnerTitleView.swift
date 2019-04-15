//
//  ImageInnerTitleView.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/8.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

class ImageInnerTitleView: FDXibBaseView {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    @IBOutlet fileprivate weak var imageView: UIImageView!
 
}

// MARK: - Config
extension ImageInnerTitleView {
    public func configUI(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}
