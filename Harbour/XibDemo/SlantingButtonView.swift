//
//  SlantingButtonView.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/8.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit
class SlantingButtonView: FDXibBaseView {
    
    enum ActionType {
        case left
        case right
    }
    
    @IBOutlet fileprivate weak var leftView: UIImageView!
    @IBOutlet fileprivate weak var leftIcon: UIImageView!
    @IBOutlet fileprivate weak var leftTitle: UILabel!
    @IBOutlet fileprivate weak var leftSubtitle: UILabel!
    
    
    @IBOutlet fileprivate weak var rightView: UIImageView!
    @IBOutlet fileprivate weak var rightIcon: UIImageView!
    @IBOutlet fileprivate weak var rightTitle: UILabel!
    @IBOutlet fileprivate weak var rightSubtitle: UILabel!
    
    // action
    public var buttonTapAction: ((ActionType)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
    
     private func initUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(tapGes:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tap(tapGes: UITapGestureRecognizer) {
        let pointA = tapGes.location(in: self)
        let PonitB = CGPoint(x: leftView.frame.maxX, y: leftView.frame.minY)
        let PonitC = CGPoint(x: rightView.frame.minX, y: rightView.frame.maxY)
        if ((PonitC - PonitB) |*| (PonitC - pointA) > 0) {
            buttonTapAction?(ActionType.right)
        }else {
            buttonTapAction?(ActionType.left)
        }
    }
}

// MARK: - config
extension SlantingButtonView {
    typealias SlantingButtonViewItem = (backImage: UIImage,IconImage: UIImage, title: String, subtitle: String)
    public func configUI(left: SlantingButtonViewItem, right: SlantingButtonViewItem) {
        
        leftView.image = left.backImage
        leftIcon.image = left.IconImage
        leftTitle.text = left.title
        leftSubtitle.text = left.subtitle
        
        rightView.image = right.backImage
        rightIcon.image = right.IconImage
        rightTitle.text = right.title
        rightSubtitle.text = right.subtitle
    }
    
}



