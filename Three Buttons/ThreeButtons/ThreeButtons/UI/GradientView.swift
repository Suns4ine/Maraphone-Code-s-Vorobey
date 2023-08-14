//
//  GradientView.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 15.08.2023.
//

import UIKit

final class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradient: Gradient?
    private var size = CGSize(width: Constant.defaultHeight,
                              height: Constant.defaultHeight)

    
    convenience init(gradient: Gradient) {
        self.init(frame: .zero)
        self.gradient = gradient
        setup()
    }
}

private extension GradientView {
    
    enum Constant {
        static let defaultHeight: CGFloat = 100
    }
    
    func setup() {
        guard let gradient,
              let layerClass = self.layer as? CAGradientLayer
        else { return }
        
        size = gradient.size

        layerClass.colors = gradient.colors
        layerClass.startPoint = gradient.coordinat.start
        layerClass.endPoint = gradient.coordinat.end
        layerClass.type = gradient.type

        layerClass.cornerRadius = size.height > 20 ? 8 : size.height / 2
        layerClass.shadowColor = UIColor.black.cgColor
        layerClass.shadowOffset = CGSizeMake(0.0,
                                             size.height > 20 ? 10.0 : size.height / 2)
        layerClass.shadowOpacity = 0.5
        layerClass.shadowRadius = 5
        
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: size.height),
            self.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
}
