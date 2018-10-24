//
//  Ball.swift
//  Bubbles
//
//  Created by Nazar Prysiazhnyi on 10/24/18.
//  Copyright © 2018 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

enum UpDown {
    case Up, Down
}

enum LeftRight {
    case Right, Left
}

class Ball: CAShapeLayer  {
    
    let radius: Double = 30
    var dX: LeftRight = .Right
    var dY: UpDown = .Down
    var startX: CGFloat = 0.0
    var startY: CGFloat = 0.0
    private var indexX: CGFloat = 1.0
    private var indexY: CGFloat { return self.indexX + 2.7181 }
    private var size: CGSize { return CGSize(width: self.radius/2, height: self.radius/2)}
    
    func created(startX: Double, startY: Double) {
        self.dX = self.direct() == 1 ? LeftRight.Left : LeftRight.Right
        self.dY = self.direct() == 1 ? UpDown.Down : UpDown.Up
        self.startY = CGFloat(startY)
        self.startX = CGFloat(startX)
        self.indexX = CGFloat(arc4random_uniform(UInt32(5)) + 1)
        let rect = CGRect(origin: CGPoint(x: startX, y: startY), size: self.size)
        let circle = UIBezierPath.init(roundedRect: rect, cornerRadius: CGFloat(radius))
        self.path = circle.cgPath
        self.fillColor = UIColor.cyan.cgColor
        self.strokeColor = UIColor.red.cgColor
        self.lineWidth = 0.5
    }
    
    func move() {
        self.startX += ( self.dX == .Left ? -self.indexX : +self.indexX)
        self.startY += ( self.dY == .Up ? -self.indexY : +self.indexY)
        self.position.x += ( self.dX == .Left ? -self.indexX : +self.indexX)
        self.position.y += ( self.dY == .Up ? -self.indexY : +self.indexY)
    }
    
    private func direct() -> Int {
        return Int(arc4random_uniform(UInt32(2)))
    }
}
