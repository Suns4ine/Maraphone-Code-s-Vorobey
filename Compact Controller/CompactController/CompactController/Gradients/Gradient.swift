//
//  Gradient.swift
//  CompactController
//
//  Created by Vyacheslav Pronin on 15.07.2023.
//

import UIKit
import Foundation

struct Gradient {
    
    /// Координаты начала и конца градиента
    typealias Coordinat = (start: CGPoint, end: CGPoint)
    
    /// Цвета
    let colors: [CGColor]
    
    /// Координаты
    let coordinat: Coordinat
    
    /// Тип градиента
    let type: CAGradientLayerType
}
