//
//  FDXibBaseCell.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/9.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

class FDXibCell<T: UIView>: UITableViewCell {

    fileprivate(set) var myContentView: T!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
    
    private func initUI() {
        myContentView = T()
        contentView.addSubview(myContentView)
        addConstraints()
    }
    
    func addConstraints() {
        myContentView.translatesAutoresizingMaskIntoConstraints = false
        let l = NSLayoutConstraint(item: myContentView!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let r = NSLayoutConstraint(item: myContentView!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let t = NSLayoutConstraint(item: myContentView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let b = NSLayoutConstraint(item: myContentView!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        self.addConstraints([l, r, t, b])
    }
}
