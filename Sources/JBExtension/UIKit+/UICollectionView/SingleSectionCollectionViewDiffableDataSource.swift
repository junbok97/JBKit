//
//  SingleSectionCollectionViewDiffableDataSource.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import UIKit

struct SingleSectionCollectionViewDiffableDataSource<T: Hashable> {

    // MARK: - Interface
    typealias DataSource = UICollectionViewDiffableDataSource<Section, T>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, T>
    
    enum Section: Int, CaseIterable {
        case main
    }

    func reset() {
        Task { @MainActor in
            var snapshot = SnapShot()
            snapshot.appendSections([.main])
            dataSource.apply(snapshot)
        }
    }

    func update(data: [T], animate: Bool = true) {
        Task { @MainActor in
            var snapshot = SnapShot()
            snapshot.appendSections([.main])
            snapshot.appendItems(data, toSection: .main)
            dataSource.apply(snapshot, animatingDifferences: animate)
        }
    }
    
    // MARK: - Attribute
    
    private let dataSource: DataSource
    
    // MARK: - Initializer
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    
    func didSelectItemAt(indexPath: IndexPath) -> T? {
        dataSource.itemIdentifier(for: indexPath)
    }
    
}
