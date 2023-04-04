//
//  UIView+Constraints.swift
//  Plants
//
//  Created by Dmitrii Morozov on 09.12.2022.
//

import UIKit

extension UIView {
    func pinToSuperviewEdges(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(
                equalTo: superview.topAnchor,
                constant: insets.top
            ),
            leftAnchor.constraint(
                equalTo: superview.leftAnchor,
                constant: insets.left
            ),
            rightAnchor.constraint(
                equalTo: superview.rightAnchor,
                constant: -insets.right
            ),
            bottomAnchor.constraint(
                equalTo: superview.bottomAnchor,
                constant: -insets.bottom
            ),
        ])
    }

    func pinToSuperviewTopEdge(constant: CGFloat) {
        guard let superview = superview else { return }
        topAnchor.constraint(
            equalTo: superview.topAnchor,
            constant: constant
        ).isActive = true
    }

    func pinToSuperviewBottomEdge(constant: CGFloat) {
        guard let superview = superview else { return }
        bottomAnchor.constraint(
            equalTo: superview.bottomAnchor,
            constant: -constant
        ).isActive = true
    }

    func constrain(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func constrain(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func alignToSuperviewCenter() {
        guard let superview = superview else { return }
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
}
