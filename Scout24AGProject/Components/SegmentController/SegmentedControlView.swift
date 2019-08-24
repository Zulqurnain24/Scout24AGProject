//
//  SegmentedControlView.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.

import UIKit
import SnapKit

protocol SegmentedControlViewDelegate: class {
    
    func didTap(segment index: Int)
    
}

// MARK: - SegmentedControlView

class SegmentedControlView: UIView {
    
    weak var delegate: SegmentedControlViewDelegate?
    
    var color: UIColor = Palette.blue.color {
        didSet {
            segmentedControl.tintColor = color
        }
    }
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: self.dataSource)
        segmentedControl.layer.cornerRadius = 4
        segmentedControl.tintColor = color
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: titleFont!], for: .normal)
        segmentedControl.addTarget(self, action: #selector(didTapOnSegment), for: .valueChanged)
        segmentedControl.tag = Tag.segmentedControl.rawValue
        return segmentedControl
    }()
    
    private var selectedIndex: Int = 0
    
    private var dataSource = [String]() {
        didSet {
            segmentedControl.removeAllSegments()
            for segment in dataSource {
                segmentedControl.insertSegment(withTitle: segment, at: segmentedControl.numberOfSegments, animated: false)
            }
            segmentedControl.selectedSegmentIndex = selectedIndex
        }
    }
    
    var titleFont: UIFont? = Typography.buttonSmall.font {
        didSet {
            guard titleFont != nil else {
                segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: Typography.buttonSmall.font!], for: .normal)
                return
            }
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: titleFont!], for: .normal)
        }
    }
    
    // MARK: - Initilizers
    
    convenience init(_ segmentNames: [String], selectIndex: Int?) {
        self.init()
        if let selected = selectIndex {
            selectedIndex = selected
        }
        dataSource = segmentNames
        setupViews()
        setupConstraints()
    }
    
}

// MARK: SegmentedControlView

private extension SegmentedControlView {
    
    private func setupViews() {
        addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = selectedIndex
    }
    
    private func setupConstraints() {
        segmentedControl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func didTapOnSegment() {
        delegate?.didTap(segment: segmentedControl.selectedSegmentIndex)
    }
    
}

// MARK: SegmentedControlView

private extension SegmentedControlView {
    
    private enum Tag: Int {
        
        case segmentedControl = 1
        
    }
    
}
