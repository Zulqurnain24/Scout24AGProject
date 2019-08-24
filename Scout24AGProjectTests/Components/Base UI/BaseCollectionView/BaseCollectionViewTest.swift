//
//  BaseCollectionViewTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class BaseCollectionViewTest: XCTestCase {
    
    private let propertyOverviewLayout = PropertyListFlowLayout()
    
    func testBaseCollectionView() {
        let propertyOverviewCollectionView: BaseCollectionView = {
            let collectionView: BaseCollectionView = BaseCollectionView(frame: .zero, collectionViewLayout: self.propertyOverviewLayout)
            collectionView.backgroundColor = Palette.white.color
            collectionView.register(AdItemCell.self, forCellWithReuseIdentifier: AdItemCell.cellID)
            collectionView.register(DetailItemCell.self, forCellWithReuseIdentifier: DetailItemCell.cellID)
            collectionView.register(BlankCollectionViewCell.self, forCellWithReuseIdentifier: BlankCollectionViewCell.cellID)
            collectionView.register(TitleButtonSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleButtonSectionHeader.sectionHeaderID)
            collectionView.register(BlankCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BlankCollectionReusableView.reusableViewID)
            return collectionView
        }()
        collectionViewTest(propertyOverviewCollectionView)
    }
    
    // MARK: - private tests
    
    private func collectionViewTest(_ collectionView: BaseCollectionView) {
        XCTAssertNotNil(collectionView)
    }
    
}
