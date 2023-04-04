//
//  ImageCell.swift
//  Plants
//
//  Created by Dmitrii Morozov on 11.12.2022.
//

import UIKit

final class ImageCell: UICollectionViewCell {
    let imageView = UIImageView()

    override var reuseIdentifier: String? {
        String(describing: ImageCell.self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    func setupViews() {
        imageView.clipsToBounds = true
        imageView.roundCorners(radius: 8)
    }

    func setupHierarchy() {
        addSubview(imageView)
    }

    func setupConstraints() {
        imageView.constrain(width: 250)
        imageView.constrain(height: 250)
        imageView.pinToSuperviewTopEdge(constant: 8)
        imageView.pinToSuperviewBottomEdge(constant: 8)
        imageView.alignToSuperviewCenter()
    }

    func update(plant: Plant) {
        imageView.load(url: plant.imageUrl)
    }
}
