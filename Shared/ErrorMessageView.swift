//
//  ErrorMessageView.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum ErrorMessageType {
    
    case error
    case success
    
    var color: UIColor {
        switch self {
        case .error: return Palette.error.color
        case .success: return Palette.success.color
        }
        
    }
}

class ErrorMessageView: UIView {
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.gray2.color
        view.tag = Tag.separatorLine.rawValue
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Palette.white.color
        label.font = Typography.body.font
        label.lineBreakMode = .byClipping
        label.minimumScaleFactor = 0.15
        label.numberOfLines = 2
        label.tag = Tag.messageLabel.rawValue
        return label
    }()
    
    var message: (message: String, type: ErrorMessageType)? {
        didSet {
            messageLabel.text = message?.message
            self.backgroundColor = message?.type.color
            messageLabel.sizeToFit()
        }
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    
    private func setupViews() {        
        addSubview(separatorLine)
        addSubview(messageLabel)
    }
    
    private func setupRegularConstraints() {
        separatorLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(-2)
        }
    }
    
    private enum Tag: Int {
        
        case separatorLine = 1
        case messageLabel = 2
        
    }
    
    func presentMessage() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.isHidden = false
        })
    }
    
    func dismissMessage() {
        UIView.animate(withDuration: 0.3, delay: 3.0, options: .curveEaseInOut, animations: {
            self.isHidden = true
        })
    }
    
}
