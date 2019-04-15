//
//  FDOperater.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/9.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

infix operator |*| : MultiplicationPrecedence
func |*| (left: CGPoint, right: CGPoint) -> CGFloat {
    return left.x * right.y - right.x * left.y
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
