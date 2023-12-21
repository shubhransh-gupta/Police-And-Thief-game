//
//  GridViewController.swift
//  GhostAndPolice
//
//  Created by Shubhransh Gupta on 21/12/23.
//

import UIKit

class GridsViewController: UIViewController {
    
    var rows : Int = 1
    var columns : Int = 1
    var positions: [IndexPath] = []
 
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: "GridCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let reshuffleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reshuffle", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(reshufflePositions), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupReshuffleButton()
        generateInitialPositions()
        
    }
    
    
    func setupReshuffleButton() {
        view.addSubview(reshuffleButton)

        NSLayoutConstraint.activate([
            reshuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reshuffleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)

        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = layout
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func reshufflePositions() {
        generateInitialPositions()
        collectionView.reloadData()
    }
    
    func generateInitialPositions() {
        positions.removeAll()
        let policePosition = generateRandomPosition()
        var thiefPosition = generateRandomPosition()
        
        while thiefPosition.section == policePosition.section || thiefPosition.item == policePosition.item {
            thiefPosition = generateRandomPosition()
        }
        positions.append(policePosition)
        positions.append(thiefPosition)
    }

    func generateRandomPosition() -> IndexPath {
        let randomRow = Int(arc4random_uniform(UInt32(rows)))
        let randomColumn = Int(arc4random_uniform(UInt32(columns)))
        return IndexPath(item: randomColumn, section: randomRow)
    }

}

extension GridsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columns
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell

        if positions.contains(indexPath) {
            cell.backgroundColor = indexPath == positions.first ? .blue : .red
            cell.imageView?.image = UIImage(systemName: "xmark.circle.fill")
        } else {
            cell.backgroundColor = .gray
            cell.imageView?.image = UIImage(systemName: "circle.fill")
        }
        


        return cell
    }
    
    
}
