//
//  Button.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.

import UIKit

enum ButtonStyle {

    case image
    case orangeWhiteLarge

}

class Button: UIButton {
    
    var style: ButtonStyle? {
        didSet {
            guard style != nil else { return }
            setup()
        }
    }
    
    private var text: String?
    
    var image: UIImage? {
        didSet {
            showImage()
        }
    }
    
    var centeredImage: Bool = false {
        didSet {
            if centeredImage {
                self.contentMode = .center
                self.imageView?.contentMode = .scaleAspectFit
            } else {
                self.contentMode = .scaleToFill
                self.imageView?.contentMode = .scaleToFill
            }
        }
    }
    
    // MARK: - Initializations
    
    init(style: ButtonStyle, text: String? = nil, image: UIImage? = nil) {
        self.style = style
        self.text = text
        self.image = image

        super.init(frame: .zero)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        switch style! {
        case .image:showImage()
        case .orangeWhiteLarge:
            setTextColor(.white)
            setBackgroundColor(.orange)
            setBorderColor(.white)
            set(size: .buttonLarge)
        }
        guard text != nil else { return }
        setTitle(text, for: .normal)
    }
    
    // MARK: - Text Color
    
    private func setTextColor(_ color: Palette) {
        setTitleColor(color.color, for: .normal)
    }
    
    // MARK: - Background Color
    
    private func setBackgroundColor(_ color: Palette) {
        backgroundColor = color.color
    }
    
    // MARK: - Borders
    
    private func setBorderColor(_ color: Palette) {
        layer.borderColor = color.color.cgColor
        layer.cornerRadius = 4
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    // MARK: - Size
    
    private func set(size: Typography) {
        titleLabel?.font = size.font
        switch size {
        case .buttonXL: frame = CGRect(x: 0, y: 0, width: 345, height: 44)
        case .buttonLarge: frame = CGRect(x: 0, y: 0, width: 345, height: 44)
        case .buttonSmall: frame = CGRect(x: 0, y: 0, width: 165, height: 28)
        default: break
        }
    }
    
    // MARK: - Image
    
    private func showImage() {
        guard image != nil else { return }
        setImage(image, for: .normal)
    }
    
}
