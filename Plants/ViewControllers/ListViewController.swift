//
//  ViewController.swift
//  Plants
//
//  Created by Dmitrii Morozov on 09.10.2022.
//

import UIKit

class ListViewController: UIViewController {
    private enum Constants {
        static let cellHeight: CGFloat = 136
    }
    private let plants: [Plant] = [
        .monstera, .calathea, .dracaena, .hedera, .ananas, .strelitzia, .aloe, .ficusBenjamina, .kalanchoe, .ficusLyrata, .yucca
    ]
    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        let screen = UIScreen.main.bounds
        layout.itemSize = CGSizeMake(
            screen.size.width,
            Constants.cellHeight
        )
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()

    init() {
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
            ListCell.self,
            forCellWithReuseIdentifier:  String(describing: ListCell.self)
        )
        collectionView.dataSource = self
        collectionView.delegate = self

        navigationItem.title = "Plants"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.pinToSuperviewEdges()
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        plants.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: ListCell.self),
            for: indexPath as IndexPath
        ) as! ListCell
        let plant = plants[indexPath.row]
        cell.update(
            title: plant.title,
            description: plant.location,
            imageUrl: plant.imageUrl
        )

        return cell
    }
}

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController(plant: plants[indexPath.row])
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
