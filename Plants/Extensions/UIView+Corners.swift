//
//  UIView+Corners.swift
//  Plants
//
//  Created by Dmitrii Morozov on 09.12.2022.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.cornerCurve = .continuous
    }
}
