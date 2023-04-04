//
//  CollectionViewCell.swift
//  Plants
//
//  Created by Dmitrii Morozov on 13.11.2022.
//

import UIKit

final class ListCell: UICollectionViewCell {
    let label = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    let imageViewContainer = UIView()
    private let stackView = UIStackView()
    private let titleSubtitleStack = UIStackView()
    private let spacerView = UIView()
    private let fillerView = UIView()

    override var reuseIdentifier: String? {
        String(describing: ListCell.self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    func update(title: String, description: String, imageUrl: URL) {
        imageView.load(url: imageUrl)
        label.text = title
        descriptionLabel.text = description
    }

    func setupViews() {
        stackView.spacing = 16
        imageView.clipsToBounds = true
        imageView.roundCorners(radius: 60)
        titleSubtitleStack.spacing = 4
        titleSubtitleStack.axis = .vertical
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        descriptionLabel.font = UIFont.systemFont(ofSize: 20.0)
    }

    func setupHierarchy() {
        addSubview(stackView)
        imageViewContainer.addSubview(imageView)
        titleSubtitleStack.addArrangedSubview(spacerView)
        titleSubtitleStack.addArrangedSubview(label)
        titleSubtitleStack.addArrangedSubview(descriptionLabel)
        titleSubtitleStack.addArrangedSubview(fillerView)
        stackView.addArrangedSubview(imageViewContainer)
        stackView.addArrangedSubview(titleSubtitleStack)
    }

    func setupConstraints() {
        stackView.pinToSuperviewEdges()
        imageView.constrain(height: 120)
        imageView.constrain(width: 120)
        imageView.pinToSuperviewEdges(
            insets: .init(
                top: 8,
                left: 8,
                bottom: 8,
                right: 8
            )
        )
    }
}
