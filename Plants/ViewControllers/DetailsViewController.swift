//
//  DetailsViewController.swift
//  Plants
//
//  Created by Dmitrii Morozov on 12.11.2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    private let plant: Plant
    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()

    init(plant: Plant) {
        self.plant = plant
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {
        collectionView.register(
            ImageCell.self,
            forCellWithReuseIdentifier:  String(describing: ImageCell.self)
        )
        collectionView.dataSource = self
        view.accessibilityIdentifier = "details_viewcontroller.view"
        navigationItem.title = plant.title
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.pinToSuperviewEdges()
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCell.self), for: indexPath as IndexPath) as! ImageCell
        cell.update(plant: plant)

        return cell
    }
}
