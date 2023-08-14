//
//  Button.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 15.08.2023.
//

import UIKit

final class Button: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.8, y: 0.8) : .identity
            }
        }
    }
    
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        imageView?.tintColor = .white
        
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        
        backgroundColor = .systemBlue
        
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        
        titleLabel?.numberOfLines = 0
        semanticContentAttribute = .forceRightToLeft
        imageView?.contentMode = .scaleAspectFit
        
        // Создание конфигурации кнопки
        var updatedConfiguration = UIButton.Configuration.plain().updated(for: self)

        updatedConfiguration.baseForegroundColor = .white

        // Установка внутренних отступов для кнопки
        updatedConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                     leading: 14,
                                                                     bottom: 10,
                                                                     trailing: 14)

        // Установка внутренних отступов для иконки
        updatedConfiguration.imagePadding = 8

        configuration = updatedConfiguration
        sizeToFit()
        
        tintColorDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        if tintAdjustmentMode == .dimmed {
            imageView?.tintColor = .gray
            backgroundColor = .black
        } else {
            imageView?.tintColor = .white
            backgroundColor = .systemBlue
        }
    }
}
