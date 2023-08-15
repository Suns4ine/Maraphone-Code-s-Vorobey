//
//  GradientView.swift
//  CompactController
//
//  Created by Vyacheslav Pronin on 15.07.2023.
//

import UIKit

final class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradient: Gradient?
    
    convenience init(gradient: Gradient) {
        self.init(frame: .zero)
        self.gradient = gradient
        setup()
    }
}

private extension GradientView {
    
    func setup() {
        guard let gradient,
              let layerClass = self.layer as? CAGradientLayer
        else { return }
        
        layerClass.colors = gradient.colors
        layerClass.startPoint = gradient.coordinat.start
        layerClass.endPoint = gradient.coordinat.end
        layerClass.type = gradient.type
    }
}
