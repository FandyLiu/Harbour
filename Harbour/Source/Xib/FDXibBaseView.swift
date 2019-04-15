//
//  FDXibBaseView.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/8.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

class FDXibBaseView: UIView {

    private(set) var xibContentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
    

    
    private func initUI() {
        xibContentView = loadViewFromNib()
        addSubview(xibContentView)
        addConstraints()
    }
    
    private func loadViewFromNib() -> UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func addConstraints() {
        xibContentView.translatesAutoresizingMaskIntoConstraints = false
        let l = NSLayoutConstraint(item: xibContentView!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let r = NSLayoutConstraint(item: xibContentView!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let t = NSLayoutConstraint(item: xibContentView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let b = NSLayoutConstraint(item: xibContentView!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        self.addConstraints([l, r, t, b])
    }

}
